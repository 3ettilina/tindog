import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 30,
        ),
        child: Column(
          children: [
            Assets.images.welcomeHeader.image(),
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
            FilledButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.googleLight.svg(
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sign In with Google',
                    style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.canvasColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
