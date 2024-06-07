import 'package:location/location.dart';

abstract class DogDataSource {
  Future<List<Map<String, dynamic>>> fetchDogs({
    required Location location,
    required double radius,
    required List<String> interests,
    required List<String> qualities,
  });

  Future<void> likeDog({
    required String dogIdFrom,
    required String dogIdToLike,
  });

  Future<void> dislikeDog({
    required String dogIdFrom,
    required String dogIdToDislike,
  });
}
