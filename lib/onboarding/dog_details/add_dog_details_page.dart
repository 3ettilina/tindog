import 'package:flutter/material.dart';
import 'package:tindog/onboarding/dog_details/view/add_dog_details_view.dart';

class AddDogDetailsPage extends StatelessWidget {
  const AddDogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: AddDogDetailsView(),
      ),
    );
  }
}
