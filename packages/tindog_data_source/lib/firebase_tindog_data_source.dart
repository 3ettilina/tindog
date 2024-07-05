import 'dart:async';
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
                  fromFirestore: (docSnapshot, _) => DogDto.fromJson(
                    docSnapshot.data()!,
                  ),
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

  late Stream<List<DogDto>> _dogs;
  late Stream<DogDto?> _myDog;

  final Set<String> _seenDogs = {};

  @override
  Future<void> createDog({required DogDto dog}) async {
    try {
      final newDog = _dogsCollection.doc(dog.id);
      await newDog.set(dog);
    } catch (e) {
      throw CreateDogException(
        message: 'Something went wrong while creating the dog,',
      );
    }
  }

  @override
  Future<AnalyzedDogDto> analyzeDog({
    required File image,
  }) async {
    try {
      final newDog = _dogsCollection.doc();
      final imageStoragePath = '$_dogImagesStoragePath/${newDog.id}.jpeg';
      await _storage.ref().child(imageStoragePath).putFile(image);

      final analyzeDogResult =
          await _functions.httpsCallable('dogDataFlow').call({
        'filePath': imageStoragePath,
      });
      final analyzeDogData = analyzeDogResult.data as Map<String, dynamic>;

      final isDog = analyzeDogData['isDog'] as bool;
      if (!isDog) {
        throw ImageUploadedIsNotADogException(
          message: 'We could not identify the dog in your image',
        );
      }
      final dogImageUrl = '$_baseStorageUrl/$imageStoragePath';
      analyzeDogData.addAll({'filePath': dogImageUrl, 'id': newDog.id});
      final analyzeDog = AnalyzedDogDto.fromJson(analyzeDogData);
      return analyzeDog;
    } on FirebaseFunctionsException catch (error) {
      dev.log(
        'Exception when calling "dogDataFlow" Firebase function',
        time: DateTime.now(),
      );
      dev.log('The error is: ${error.message}');
      throw UnableToAnalyzeDog(message: error.message ?? error.details);
    } on ImageUploadedIsNotADogException catch (_) {
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
  Future<void> createChatForDogs({
    required String myDogId,
    required String likedDogId,
  }) async {
    try {
      await _functions.httpsCallable('matchDogs').call({
        'firstDogId': myDogId,
        'secondDogId': likedDogId,
      });
    } on FirebaseFunctionsException catch (error) {
      throw UnableToCreateChatException(
        message: error.message ?? error.details,
      );
    } catch (e) {
      throw UnableToCreateChatException(message: e.toString());
    }
  }

  @override
  Future<bool> likeDog({
    required DogDto myDog,
    required DogDto dogToLike,
  }) async {
    try {
      final dogRef = _dogsCollection.doc(myDog.id);

      await dogRef.update({
        'likes': FieldValue.arrayUnion([dogToLike.id]),
        'seen': FieldValue.arrayUnion([dogToLike.id]),
      });
      _seenDogs.add(dogToLike.id);
      final dogsDidMatch = hasMatch(myDog: myDog, likedDog: dogToLike);
      createChatForDogs(myDogId: myDog.id, likedDogId: dogToLike.id);
      return dogsDidMatch;
    } on UnableToCreateChatException catch (e) {
      throw UnableToCreateChatException(message: e.message);
    } catch (e) {
      _seenDogs.remove(dogToLike.id);
      throw UnableToLikeDogException(message: e.toString());
    }
  }

  @override
  Future<void> dislikeDog({
    required DogDto myDog,
    required DogDto dogToDislike,
  }) async {
    try {
      final dogRef = _dogsCollection.doc(myDog.id);
      _seenDogs.add(dogToDislike.id);
      await dogRef.update({
        'seen': FieldValue.arrayUnion([dogToDislike.id]),
      });
    } catch (e) {
      _seenDogs.remove(dogToDislike.id);
      rethrow;
    }
  }

  @override
  Stream<List<ChatDto>> fetchChats({required String userId}) {
    try {
      // TODO(3ettilina): Implement this during the Workshop
      throw UnimplementedError();
    } catch (e) {
      throw UnableToFetchChatsException(message: e.toString());
    }
  }

  @override
  Future<void> fetchDogs({
    required String myDogId,
    String? city,
    String? country,
    List<String>? interests,
  }) async {
    try {
      final Stream<QuerySnapshot<DogDto>> dogSnapshots =
          _dogsCollection.orderBy('name').snapshots();
      _dogs = dogSnapshots.map((snapshot) {
        final dogsDtoNotMine = snapshot.docs.where((doc) => doc.id != myDogId);
        final dogs = dogsDtoNotMine.map((dogDto) => dogDto.data());
        final dogsNotSeen =
            dogs.where((dog) => !(_seenDogs.contains(dog.id))).toList();
        return dogsNotSeen;
      });
    } catch (e) {
      throw FetchDogsException(message: e.toString());
    }
  }

  @override
  Stream<List<DogDto>> get dogs => _dogs;

  @override
  bool hasMatch({
    required DogDto myDog,
    required DogDto likedDog,
  }) =>
      likedDog.likes.contains(myDog.id);

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
      final dogRef = await _dogsCollection.doc(dogId).get();
      final dog = dogRef.data()!;
      _seenDogs.addAll(dog.seen);
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

  @override
  Future<void> userDog({required String userId}) async {
    try {
      final Stream<QuerySnapshot<DogDto>> dogSnapshot =
          _dogsCollection.where('userId', isEqualTo: userId).snapshots();
      _myDog = dogSnapshot.map((snapshot) {
        final result = snapshot.docs.map((doc) => doc.data()).toList().first;

        _seenDogs.clear();
        _seenDogs.addAll(result.seen);

        return result;
      });
    } catch (e) {
      return;
    }
  }

  @override
  Stream<DogDto?> get myDog => _myDog;
}
