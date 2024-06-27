import 'dart:io';

import 'package:tindog_data_source/dto/dto.dart';

abstract class TindogDataSource {
  /// Creates a new [Dog] on the database and uploads it's image
  /// to the corresponding storage.
  /// Returns the path url of the image.
  Future<void> createDog({required DogDto dog});

  /// Given a [filePath] of an image stored in Firebase Storage
  /// it returns information of the image if a dog is in it.
  /// Otherwise it returns {isDog = false}, if the image is not a dog.
  /// When success, this is the expected response:
  /// {
  ///   isDog: true | false,
  ///   breed: String,
  ///   size: String - small | medium | big,
  ///   description: String,
  /// }
  Future<AnalyzedDogDto> analyzeDog({
    required File image,
  });

  /// After setting all the onboarding info
  /// update the doc ID for that dog with all the info
  /// [id] is the identification of the dog
  /// [userId] is the identification of the dog´s owner
  Future<void> setDogDetails({
    required DogDto dog,
  });

  /// Given a [location] and a list of [interests] <String>.
  /// Returns a list of [Dog]s that match the same location and any interest.
  /// If there's no match, it returns an empty list.
  Future<List<DogDto>> fetchDogs({
    required String dogId,
    required String location,
    required List<String> interests,
  });

  /// Handles the behavior of "liking" another dog.
  /// Associates the [dogIdToLike] as one dog liked by [dogIdFrom]
  Future<void> likeDog({
    required String dogIdFrom,
    required String dogIdToLike,
  });

  /// Handles the behavior of "disliking" another dog, so it doesn't show
  /// up again when calling fetchDogs().
  /// Associates the [dogIdToDislike] as one dog not liked by [dogIdFrom]
  Future<void> dislikeDog({
    required String dogIdFrom,
    required String dogIdToDislike,
  });

  /// Check whether a match has happened between 2 dogs.
  /// Should return true when [firstDogId] has liked [secondDogId] AND
  /// [secondDogId] has also liked [firstDogId].
  Future<bool> hasMatch({
    required String firstDogId,
    required String secondDogId,
  });

  /// After a match happens, hit the backend with the two dog ids
  /// so a new personalized chat is created for them.
  Future<InitialMessageChatDto> createChatForDogs({
    required String firstDogId,
    required String secondDogId,
  });

  /// chats collection fetch by the ID of the User
  /// owner of the dog
  Future<List<ChatDto>> fetchChats({
    required String userId,
  });

  /// Returns the details of the Dog to show up in a profile screen.
  Future<DogDto> getDogDetails({
    required String dogId,
  });

  /// Sends a message into a specified chat.
  Future<void> sendChatMessage({
    required String chatId,
    required String text,
    required String senderId,
  });
}
