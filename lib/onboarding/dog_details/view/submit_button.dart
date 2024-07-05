import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/dog_details/bloc/add_dog_details_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddDogDetailsCubit>();
    final isValid = context
        .select<AddDogDetailsCubit, bool>((cubit) => cubit.state.isValid);
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
