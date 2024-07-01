import 'package:app_ui/app_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/dog_details/bloc/dog_details_cubit.dart';

class AddDogDetailsView extends StatelessWidget {
  const AddDogDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogDetailsCubit, DogDetailsState>(
      builder: (context, state) {
        return switch (state) {
          DogDetailsInitial() ||
          DogDetailsCompleted() ||
          DogDetailsSubmitting() =>
            Center(
              child: Assets.images.loadingPaws.image(width: 130),
            ),
          DogDetailsEditing() || DogDetailsErrorSubmitting() => Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Let\'s add some more details 🐾',
                          style: context.textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 30),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            state.imagePath!,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const DogDetailsForm(),
                        const SizedBox(height: 50),
                        if (state is DogDetailsErrorSubmitting)
                          AppInfoCard.warning(text: state.message),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: _SubmitButton(),
                ),
              ],
            ),
        };
      },
    );
  }
}

class DogDetailsForm extends StatelessWidget {
  const DogDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogDetailsCubit, DogDetailsState>(
      buildWhen: (prev, curr) => curr is DogDetailsEditing,
      builder: (context, state) {
        final cubit = context.read<DogDetailsCubit>();
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
                      labelText: 'What\'s its age?',
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
                    defaultSingleValue: state.age!.unit,
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
              options: DogSize.values,
              onValueSelected: cubit.setDogSize,
            ),
            const SizedBox(height: 20),
            Text(
              'Is it neutered?',
              style: context.textTheme.bodyMedium,
            ),
            AppChoiceChips<bool>.singleOption(
              defaultSingleValue: true,
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isValid =
        context.select<DogDetailsCubit, bool>((cubit) => cubit.state.isValid);
    final cubit = context.read<DogDetailsCubit>();
    return Container(
      color: Colors.purple.shade50.withOpacity(0.9),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      child: AppFilledButton(
        label: 'Complete profile',
        onPressed: isValid ? cubit.submitProfile : null,
      ),
    );
  }
}
