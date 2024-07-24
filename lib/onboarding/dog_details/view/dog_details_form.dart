import 'package:app_ui/app_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/dog_details/bloc/add_dog_details_cubit.dart';

class DogDetailsForm extends StatelessWidget {
  const DogDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDogDetailsCubit, AddDogDetailsState>(
      buildWhen: (prev, curr) => curr is DogDetailsEditing,
      builder: (context, state) {
        final cubit = context.read<AddDogDetailsCubit>();
        return Column(
          children: [
            TextFormField(
              initialValue: state.name,
              decoration: const InputDecoration(
                labelText: 'What\'s your puppy\'s name?',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
              onChanged: cubit.setDogName,
            ),
            const SizedBox(height: 20),
            Text(
              'What\'s it gender?',
              style: context.textTheme.bodyMedium,
            ),
            AppChoiceChips<DogGender>.singleOption(
              options: DogGender.values,
              onValueSelected: cubit.setDogGender,
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: state.breed,
              decoration: const InputDecoration(
                labelText: 'What\'s its breed?',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
              onChanged: cubit.setDogBreed,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Its age?',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (age) {
                      cubit.setDogAge(age: age);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: AppChoiceChips<AgeUnit>.singleOption(
                    options: const [AgeUnit.months, AgeUnit.years],
                    onValueSelected: (unit) {
                      cubit.setDogAge(unit: unit);
                    },
                    direction: Axis.vertical,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'What\'s it size?',
              style: context.textTheme.bodyMedium,
            ),
            AppChoiceChips<DogSize>.singleOption(
              defaultSingleValue: state.size,
              options:
                  List.from([DogSize.small, DogSize.medium, DogSize.large]),
              onValueSelected: cubit.setDogSize,
            ),
            const SizedBox(height: 20),
            Text(
              'Is it neutered?',
              style: context.textTheme.bodyMedium,
            ),
            AppChoiceChips<bool>.singleOption(
              options: const [true, false],
              onValueSelected: cubit.setDogNeutered,
            ),
            const SizedBox(height: 25),
            TextFormField(
              initialValue: state.description,
              decoration: const InputDecoration(
                labelText: 'What best describes your pet?',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              onChanged: cubit.setDogDescription,
            ),
            const SizedBox(height: 20),
            Text(
              'What interests does it has?',
              style: context.textTheme.bodyMedium,
            ),
            AppChoiceChips.multipleOption(
              options: const [
                'walking',
                'senior dog gathering',
                'playing',
                'hiking',
                'breeding',
                'playing fetch',
                'swimming'
              ],
              onMultipleSelected: cubit.setDogInterests,
            ),
          ],
        );
      },
    );
  }
}
