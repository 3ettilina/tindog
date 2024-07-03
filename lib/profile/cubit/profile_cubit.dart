import 'package:core/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileNotReady());

  void completeOnboarding(Dog dog) {
    emit(ProfileData(dog));
  }
}
