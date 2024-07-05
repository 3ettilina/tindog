import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/app/extensions/build_context_extensions.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AuthErrorListener(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Assets.images.onboardingWelcome.image(
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Welcome to Tindog!',
                      style: context.theme.textTheme.headlineMedium!.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '''The place where your dog can find a pawesome buddy to play or breed.''',
                      style: context.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Text(
                      'Sign in and start the adventure! 🐾',
                      style: context.textTheme.titleMedium,
                    ),
                    Assets.images.arrowDownDouble.image(height: 80),
                    AppSignInButton.google(
                      onPressed: () => context.authBloc.add(LogIn()),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthErrorListener extends StatelessWidget {
  const _AuthErrorListener({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (prev, curr) {
        if (curr is AuthenticationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(curr.message),
            ),
          );
        }
      },
      child: child,
    );
  }
}
