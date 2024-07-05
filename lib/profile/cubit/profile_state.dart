part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileNotReady extends ProfileState {
  const ProfileNotReady();

  @override
  List<Object?> get props => [];
}

class ProfileData extends ProfileState {
  const ProfileData(this.dog);

  final Dog dog;

  @override
  List<Object?> get props => [dog];
}
