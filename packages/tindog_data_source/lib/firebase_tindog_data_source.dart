import 'dart:developer' as dev;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tindog_data_source/dto/dto.dart';
import 'package:tindog_data_source/exceptions/exceptions.dart';
import 'package:tindog_data_source/tindog_data_source.dart';
import 'package:tindog_data_source/tindog_data_source_contract.dart';

const _dogImagesStoragePath = 'dogs';
const _baseStorageUrl =
    'https://storage.googleapis.com/tindog-4edd4.appspot.com';

class FirebaseTindogDataSource implements TindogDataSource {
  FirebaseTindogDataSource({
    CollectionReference<DogDto>? dogsCollection,
    CollectionReference<ChatDto>? chatsCollection,
    FirebaseStorage? storage,
    FirebaseFunctions? functions,
  })  : _dogsCollection = dogsCollection ??
            FirebaseFirestore.instance.collection('dogs').withConverter(
                  fromFirestore: (docSnapshot, _) =>
                      DogDto.fromJson(docSnapshot.data()!),
                  toFirestore: (dogDto, _) => dogDto.toJson(),
                ),
        _chatsCollection = chatsCollection ??
            FirebaseFirestore.instance.collection('chats').withConverter(
                  fromFirestore: (docSnapshot, _) =>
                      ChatDto.fromJson(docSnapshot.data()!),
                  toFirestore: (chatDto, _) => chatDto.toJson(),
                ),
        _storage = storage ?? FirebaseStorage.instance,
        _functions = functions ?? FirebaseFunctions.instance;

  final CollectionReference<DogDto> _dogsCollection;
  final CollectionReference<ChatDto> _chatsCollection;
  final FirebaseStorage _storage;
  final FirebaseFunctions _functions;

  @override
  Future<void> createDog({required DogDto dog}) async {
    try {
      final newDog = _dogsCollection.doc(dog.id);
      await newDog.set(dog);
    } catch (e) {
      throw CreateDogException(
          message: 'Something went wrong while creating the dog,');
    }
  }

  @override
  Future<AnalyzedDogDto> analyzeDog({
    required File image,
  }) async {
    try {
      final newDog = _dogsCollection.doc();
      await _storage
          .ref()
          .child('$_dogImagesStoragePath/${newDog.id}.jpeg')
          .putFile(image);

      final analyzeDogResult =
          await _functions.httpsCallable('dogDataFlow').call({
        'filePath': '$_dogImagesStoragePath/${newDog.id}.jpeg',
      });
      final analyzeDogData = analyzeDogResult.data as Map<String, dynamic>;

      print(analyzeDogData);
      final isDog = analyzeDogData['isDog'] as bool;
      if (!isDog) {
        throw ImageUploadedIsNotADogException(
          message: 'The image you picked is not'
              'associated to a dog.',
        );
      }
      final dogImageUrl = Uri.encodeComponent(
        '$_baseStorageUrl/$_dogImagesStoragePath/${newDog.id}.jpeg',
      );
      print(dogImageUrl);
      // Adding the 'filePath' as it doesn't come from the dogDataFlow response
      analyzeDogData.addAll({'filePath': dogImageUrl});
      final analyzeDog = AnalyzedDogDto.fromJson(analyzeDogData);
      return analyzeDog;
    } on FirebaseFunctionsException catch (error) {
      dev.log(
        'Exception when calling "dogDataFlow" Firebase function',
        time: DateTime.now(),
      );
      dev.log('The error is: ${error.message}');
      throw UnableToAnalyzeDog(message: error.message ?? error.details);
    } on ImageUploadedIsNotADogException catch (e) {
      rethrow;
    } catch (e) {
      dev.log(
        'Something went wrong while analyzing dog',
        time: DateTime.now(),
      );
      dev.log('The error is: ${e.toString()}');
      throw UnableToAnalyzeDog(message: e.toString());
    }
  }

  @override
  Future<InitialMessageChatDto> createChatForDogs({
    required String firstDogId,
    required String secondDogId,
  }) async {
    try {
      final matchDogsResult = await _functions.httpsCallable('matchDogs').call({
        'firstDogId': firstDogId,
        'secondDogId': secondDogId,
      });

      final matchDogsJson = matchDogsResult as Map<String, dynamic>;
      final initialMessageJson = matchDogsJson['text'] as Map<String, dynamic>;
      final initialMessage = InitialMessageChatDto.fromJson(initialMessageJson);
      return initialMessage;
    } on FirebaseFunctionsException catch (error) {
      final errorCode = error.code;
      switch (errorCode) {
        case 'unauthenticated':
          throw UserNotAuthenticatedException(
            message: error.message ?? error.details,
          );
        case 'invalid-argument':
          throw ArgumentError(error.message);
        case 'permission-denied':
          throw UserNotAuthorizedException(
              message: error.message ?? error.details);
        case 'already-exists':
          throw ChatAlreadyExistsException(
              message: error.message ?? error.details);
        default:
          throw UnableToCreateChatException(
              message: error.message ?? error.details);
      }
    } catch (e) {
      throw UnableToCreateChatException(message: e.toString());
    }
  }

  @override
  Future<void> dislikeDog({
    required String dogIdFrom,
    required String dogIdToDislike,
  }) async {
    try {
      final dogRef = _dogsCollection.doc(dogIdFrom);
      final dogSnapshot = await dogRef.get();
      final dogDetails = dogSnapshot.data();
      if (dogDetails != null) {
        final seen = List<String>.from(dogDetails.seen)..add(dogIdToDislike);
        await dogRef.update({
          'seen': seen,
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ChatDto>> fetchChats({required String userId}) async {
    try {
      final chatsRef = await _chatsCollection
          .where('userIds', arrayContains: userId)
          .orderBy('lastMessage.timestamp')
          .get();
      final chatsJson = chatsRef as List<Map<String, dynamic>>;
      final chats = chatsJson.map(ChatDto.fromJson).toList();
      return chats;
    } catch (e) {
      throw UnableToCreateChatException(message: e.toString());
    }
  }

  @override
  Future<List<DogDto>> fetchDogs({
    required String dogId,
    required String location,
    required List<String> interests,
  }) async {
    try {
      final currentDogRef = await _dogsCollection.doc(dogId).get();
      final currentDog = currentDogRef.data();
      final currentDogSeen = currentDog?.seen;

      final dogsRef = await _dogsCollection
          .where('dogId', whereNotIn: currentDogSeen)
          .get();
      final dogs = dogsRef.docs.map((doc) => doc.data()).toList();
      return dogs;
    } catch (e) {
      throw FetchDogsException(message: e.toString());
    }
  }

  @override
  Future<bool> hasMatch({
    required String firstDogId,
    required String secondDogId,
  }) async {
    try {
      final firstDogDoc = await _dogsCollection.doc(firstDogId).get();
      final firstDogJson = firstDogDoc as Map<String, dynamic>;
      final firstDog = DogDto.fromJson(firstDogJson);
      final secondDogDoc = await _dogsCollection.doc(secondDogId).get();
      final secondDogJson = secondDogDoc as Map<String, dynamic>;
      final secondDog = DogDto.fromJson(secondDogJson);

      final hasMatch = firstDog.likes.contains(secondDog.id) &&
          secondDog.likes.contains(firstDogId);
      return hasMatch;
    } catch (e) {
      throw MatchDogsException(message: e.toString());
    }
  }

  @override
  Future<void> likeDog({
    required String dogIdFrom,
    required String dogIdToLike,
  }) async {
    try {
      final dogRef = _dogsCollection.doc(dogIdFrom);
      final dogDoc = await dogRef.get();
      final dogDetails = dogDoc.data()!;
      final likedDogs = List<String>.from(dogDetails.likes)..add(dogIdToLike);
      final seenDogs = List<String>.from(dogDetails.seen)..add(dogIdToLike);
      await dogRef.update({
        'likes': likedDogs,
        'seen': seenDogs,
      });
    } catch (e) {
      throw UnableToLikeDogException(message: e.toString());
    }
  }

  @override
  Future<void> setDogDetails({
    required DogDto dog,
  }) async {
    try {
      final dogJson = dog.toJson();
      await _dogsCollection.doc(dog.id).update(dogJson);
    } catch (e) {
      throw UnableToUpdateDogException(message: e.toString());
    }
  }

  @override
  Future<DogDto> getDogDetails({required String dogId}) async {
    try {
      final dogRef = _dogsCollection.doc(dogId).get();
      final dogJson = dogRef as Map<String, dynamic>;
      final dog = DogDto.fromJson(dogJson);
      return dog;
    } catch (e) {
      throw UnableToGetDogDetailsException(message: e.toString());
    }
  }

  @override
  Future<void> sendChatMessage({
    required String chatId,
    required String senderId,
    required String text,
  }) async {
    try {
      final newMessage = UserMessageChatDto(
        timestamp: DateTime.now(),
        text: text,
        isRead: false,
        userId: senderId,
      );
      final chatRef = _chatsCollection.doc(chatId);
      chatRef.collection('messages').add(newMessage.toJson());
    } catch (e) {
      throw UnableToSendMessage(
        message:
            'Something went wrong while sending the message, please try again.',
      );
    }
  }
}
