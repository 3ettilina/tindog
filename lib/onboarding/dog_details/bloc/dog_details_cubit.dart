import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/app/extensions/string_extensions.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'dog_details_state.dart';

class DogDetailsCubit extends Cubit<DogDetailsState> {
  DogDetailsCubit({
    required TindogRepository repository,
  })  : _repository = repository,
        super(const DogDetailsInitial());

  final TindogRepository _repository;

  void setup({
    required String id,
    required String imageUrl,
    required String breed,
    required DogSize size,
    required String description,
  }) {
    emit(
      DogDetailsEditing(
        id: id,
        imagePath: imageUrl,
        breed: breed,
        size: size,
        description: description,
      ),
    );
  }

  void setDogName(String name) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(name: name));
    }
  }

  void setDogGender(DogGender gender) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(gender: gender));
    }
  }

  void setDogBreed(String breed) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(breed: breed));
    }
  }

  void setDogAge({String? age, AgeUnit? unit}) {
    final intAge = (age != null) ? int.tryParse(age) : null;
    final st = state;
    if (st is DogDetailsEditing) {
      final newAge = st.age!.copyWith(
        value: intAge,
        unit: unit,
      );
      emit(st.copyWith(age: newAge));
    }
  }

  void setDogSize(DogSize size) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(size: size));
    }
  }

  void setDogNeutered(bool isNeutered) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(isNeutered: isNeutered));
    }
  }

  void setDogDescription(String description) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(description: description));
    }
  }

  void setDogInterests(List<String> interests) {
    final st = state;
    if (st is DogDetailsEditing) {
      emit(st.copyWith(interests: interests));
    }
  }

  Future<void> submitProfile() async {
    final st = state;
    if (st is DogDetailsEditing || st is DogDetailsErrorSubmitting) {
      emit(
        DogDetailsSubmitting(
          id: st.id,
          name: st.name,
          imagePath: st.imagePath,
          breed: st.breed,
          size: st.size,
          description: st.description,
          gender: st.gender,
          age: st.age,
          isNeutered: st.isNeutered,
          interests: st.interests,
        ),
      );
      final dog = Dog(
        id: st.id!,
        name: st.name!,
        breed: st.breed!,
        gender: st.gender!,
        age: st.age!,
        size: st.size!,
        imagePath: st.imagePath!,
        isNeutered: st.isNeutered!,
        interests: st.interests!,
        description: st.description!,
      );

      final response = await _repository.submitDogProfile(dog: dog);

      switch (response) {
        case CreateDogProfileSuccess():
          emit(const DogDetailsCompleted());
        case CreateDogProfileError():
          emit(
            DogDetailsErrorSubmitting(
              message: response.message,
              id: st.id,
              imagePath: st.imagePath,
              breed: st.breed,
              size: st.size,
              description: st.description,
              gender: st.gender,
              name: st.name,
              age: st.age,
              isNeutered: st.isNeutered,
              interests: st.interests,
            ),
          );
      }
    }
  }
}
