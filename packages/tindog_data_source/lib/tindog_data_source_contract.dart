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

  /// Verifies whether the current user already has a dog's profile
  /// Finds a dog which contains a userId as the current UUID,
  /// if exists then [true], otherwise [false]
  Future<void> userDog({
    required String userId,
  });

  Stream<DogDto?> get myDog;

  /// Collects all dogs and adds it to a stream for easy consumption and update.
  Future<void> fetchDogs({
    required DogDto myDog,
    String? city,
    String? country,
    List<String>? interests,
  });

  Stream<List<DogDto>> get dogs;

  /// Handles the behavior of "liking" another dog.
  /// Associates the [dogIdToLike] as one dog liked by [myDog]
  Future<bool> likeDog({
    required DogDto myDog,
    required DogDto dogToLike,
  });

  /// Handles the behavior of "disliking" another dog, so it doesn't show
  /// up again when calling fetchDogs().
  /// Associates the [dogToDislike] as one dog not liked by [myDog]
  Future<void> dislikeDog({
    required DogDto myDog,
    required DogDto dogToDislike,
  });

  /// Check whether a match has happened between 2 dogs.
  /// Should return true when [firstDogId] has liked [secondDogId] AND
  /// [secondDogId] has also liked [firstDogId].
  bool hasMatch({
    required DogDto myDog,
    required DogDto likedDog,
  });

  /// After a match happens, hit the backend with the two dog ids
  /// so a new personalized chat is created for them.
  Future<void> createChatForDogs({
    required String myDogId,
    required String likedDogId,
  });

  /// chats collection fetch by the ID of the User
  /// owner of the dog
  Stream<List<ChatDto>> fetchChats({
    required String userId,
  });

  /// Sends a message into a specified chat.
  Future<void> sendChatMessage({
    required String chatId,
    required String text,
    required String senderId,
  });
}
