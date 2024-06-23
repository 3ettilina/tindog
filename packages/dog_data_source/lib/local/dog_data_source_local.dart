import 'package:dog_data_source/dog_data_source.dart';
import 'package:dog_data_source/local/dogs.dart';

class DogDataSourceLocal implements DogDataSource {
  @override
  Future<void> dislikeDog({
    required String dogIdFrom,
    required String dogIdToDislike,
  }) {
    // TODO: implement dislikeDog
    throw UnimplementedError();
  }

  @override
  Future<void> likeDog({
    required String dogIdFrom,
    required String dogIdToLike,
  }) {
    // TODO: implement likeDog
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> analyzeDog({required String image}) {
    // TODO: implement analyzeDog
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> didMatch(
      {required String dogId1, required String dogId2}) {
    // TODO: implement didMatch
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> fetchChats({required String userId}) {
    // TODO: implement fetchChats
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchDogs({
    required String location,
    required List<String> interests,
  }) {
    return Future.delayed(Duration(seconds: 2), () {
      return dogsJson;
    });
  }

  @override
  Future<void> setDog({
    required String id,
    required String name,
    required int age,
    required String breed,
    required String gender,
    required List<String> interests,
    required String description,
  }) {
    // TODO: implement setDog
    throw UnimplementedError();
  }
}
