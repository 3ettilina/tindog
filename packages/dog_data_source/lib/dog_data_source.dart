abstract class DogDataSource {
  // breed
  // age
  // temperements
  // size
  // Create doc in Firebase
  // Use the id to create a path in storage to store images
  // Stores image in Firebase Storage and
  // then hit endpoint to get info about dog

  // if the image sent is not from a dog, the response will
  // contain a "isDog" false, and a "message" to show the user
  Future<Map<String, dynamic>> analyzeDog({
    required String image,
  });

  /// After setting all the onboarding info
  /// update the doc ID for that dog with all the info
  Future<void> setDog({
    required String id,
    required String name,
    required int age,
    required String breed,
    required String gender,
    required List<String> interests,
    required String description,
  });

  Future<List<Map<String, dynamic>>> fetchDogs({
    required String location,
    required List<String> interests,
  });

  Future<void> likeDog({
    required String dogIdFrom,
    required String dogIdToLike,
  });

  Future<void> dislikeDog({
    required String dogIdFrom,
    required String dogIdToDislike,
  });

  /// When a match happens, send both dog ids,
  /// backend creates a new chat for them.
  Future<Map<String, dynamic>> didMatch({
    required String dogId1,
    required String dogId2,
  });

  /// chats collection fetch by the ID of the User
  /// owner of the dog
  Future<Map<String, dynamic>> fetchChats({
    required String userId,
  });
}
