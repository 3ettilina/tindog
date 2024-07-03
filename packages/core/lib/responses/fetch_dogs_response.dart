import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

sealed class FetchDogsResponse extends Equatable {
  const FetchDogsResponse();
}

class FetchDogsSuccess extends FetchDogsResponse {
  const FetchDogsSuccess(this.dogs);

  final List<Dog> dogs;

  @override
  List<Object?> get props => [dogs];
}

class FetchDogsError extends FetchDogsResponse {
  const FetchDogsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
