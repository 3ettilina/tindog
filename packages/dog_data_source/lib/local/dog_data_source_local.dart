import 'package:dog_data_source/dog_data_source.dart';
import 'package:dog_data_source/local/dogs.dart';
import 'package:location/location.dart';

class DogDataSourceLocal implements DogDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchDogs({
    required Location location,
    required double radius,
    required List<String> interests,
    required List<String> qualities,
  }) async {
    return Future.delayed(Duration(seconds: 2), () {
      return dogsJson;
    });
  }

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
}
