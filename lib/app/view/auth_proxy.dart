import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tindog/auth/auth_page.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/onboarding/dog_image_selection/bloc/select_dog_image_bloc.dart';

class AuthProxy extends StatelessWidget {
  const AuthProxy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          if (state.isNewUser) {
            context
                .read<SelectDogImageBloc>()
                .add(const CheckGalleryPermission());
            context.pushNamed('onboarding');
          } else {
            context.pushNamed('discover');
          }
        }
      },
      child: const AuthPage(),
    );
  }
}
