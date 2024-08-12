import 'dart:async';
import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:core/core.dart';
import 'package:tindog_data_source/tindog_data_source.dart';
import 'package:tindog_repository/extensions/chat_extension.dart';
import 'package:tindog_repository/extensions/dog_extension.dart';

class TindogRepository {
  TindogRepository({
    TindogDataSource? dataSource,
    AuthRepository? authRepository,
  })  : _dataSource = dataSource ?? FirebaseTindogDataSource(),
        _authRepository = authRepository ?? AuthRepository();

  final TindogDataSource _dataSource;
  final AuthRepository _authRepository;

  Stream<List<Dog>?> _dogs = Stream.empty();
  Stream<List<Chat>?> _chats = Stream.empty();
  Stream<Chat?> _chat = Stream.empty();
  Stream<Dog?> _myDog = Stream.empty();
  late Future<Dog?> myDogSync;

  Future<void> checkUserHasDog({required String userId}) async {
    await _dataSource.userDog(userId: userId);
    _myDog = _dataSource.myDog.map((dto) {
      final dog = dto?.dog;
      myDogSync = Future.value(dog);
      return dog;
    });
  }

  Stream<Dog?> get myDog => _myDog;

  Future<AnalyzeDogResult> verifyDogImage({
    required File dogImage,
  }) async {
    try {
      final analyzeDogResult = await _dataSource.analyzeDog(image: dogImage);
      final user = await _authRepository.currentUserId;
      final output = AnalyzeDogDetails(
        id: analyzeDogResult.id,
        imagePath: analyzeDogResult.filePath,
        breed: analyzeDogResult.breed,
        size: DogSize.fromName(analyzeDogResult.size),
        description: analyzeDogResult.description,
        userId: user!,
      );
      return output;
    } on ImageUploadedIsNotADogException catch (_) {
      return AnalyzeDogErrorNoDogOnImage(
        message:
            '''The image provided does not come from a dog. Please select another one.''',
      );
    } on CreateDogException catch (_) {
      return AnalyzeDogError(
          message: 'Something went wrong while creating the Dog');
    } catch (e) {
      return AnalyzeDogError(
          message: 'Something went wrong while creating the Dog');
    }
  }

  Future<CreateDogProfileResponse> submitDogProfile({
    required Dog dog,
  }) async {
    try {
      await _dataSource.createDog(dog: dog.dto);
      return CreateDogProfileSuccess();
    } on CreateDogException catch (_) {
      return CreateDogProfileError(
        'Something went wrong while creating the profile :(',
      );
    }
  }

  Future<void> fetchDogs() async {
    try {
      final myDog = await myDogSync;
      final dto = myDog!.dto;
      await _dataSource.fetchDogs(myDog: dto);
      _dogs = _dataSource.dogs.map((streamDto) {
        final dogs = streamDto.map((dogDto) => dogDto.dog).toList();
        return dogs;
      });
    } catch (e) {
      _dogs = Stream.value(null);
    }
  }

  Stream<FetchDogsResponse> get dogs {
    return _dogs.map((list) {
      if (list == null) {
        return FetchDogsError('Something went wrong while fetching dogs');
      }
      return FetchDogsSuccess(list);
    });
  }

  Future<bool> dislikeDog({
    required Dog myDog,
    required Dog dogToDislike,
  }) async {
    try {
      await _dataSource.dislikeDog(
        myDog: myDog.dto,
        dogToDislike: dogToDislike.dto,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<LikeDogResponse> likeDog({
    required Dog myDog,
    required Dog dogToLike,
  }) async {
    try {
      final hasMatch = await _dataSource.likeDog(
        myDog: myDog.dto,
        dogToLike: dogToLike.dto,
      );
      if (hasMatch) {
        return DogsDidMatch(myDog: myDog, likedDog: dogToLike);
      }
      return DogLiked();
    } on UnableToLikeDogException catch (_) {
      return ErrorLikingDog();
    } on UnableToCreateChatException catch (_) {
      return ChatBetweenDogsAlreadyExists();
    } catch (e) {
      return ErrorLikingDog();
    }
  }

  Future<void> fetchChats() async {
    try {
      final userId = await _authRepository.currentUserId;
      if (userId != null) {
        _chats = _dataSource.fetchChats(userId: userId).map((stream) {
          final chats =
              stream.map((chatDto) => chatDto.toChat(userId: userId)).toList();
          return chats;
        });
      }
    } catch (e) {
      _chats = Stream.value(null);
    }
  }

  Stream<FetchChatsResponse> get chats {
    return _chats.map((list) {
      if (list == null) {
        return FetchChatsError('Something went wrong while fetching dogs');
      }
      return FetchChatsSuccess(list);
    });
  }

  Future<void> fetchSingleChat({required String chatId}) async {
    try {
      final userId = await _authRepository.currentUserId;
      _chat = _dataSource.fetchChat(chatId: chatId).map((stream) {
        return stream.toChat(userId: userId!);
      });
    } catch (e) {
      _chats = Stream.value(null);
    }
  }

  Stream<SingleChatResponse> get chat {
    return _chat.map((chat) {
      if (chat == null) {
        return SingleChatError('Something went wrong while fetching dogs');
      }
      return SingleChatSuccess(chat);
    });
  }
}
