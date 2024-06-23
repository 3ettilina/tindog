import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppSignInButtonType {
  google(),
  apple();

  SvgPicture get icon {
    switch (this) {
      case AppSignInButtonType.apple:
        return Assets.icons.appleLight.svg(
          width: 24,
          height: 24,
        );

      case AppSignInButtonType.google:
        return Assets.icons.googleLight.svg(
          width: 24,
          height: 24,
        );
    }
  }

  String get label {
    switch (this) {
      case AppSignInButtonType.apple:
        return 'Sign In with Apple';
      case AppSignInButtonType.google:
        return 'Sign In with Google';
    }
  }
}

class AppSignInButton extends StatelessWidget {
  const AppSignInButton.google({
    required this.onPressed,
    super.key,
  }) : type = AppSignInButtonType.google;

  const AppSignInButton.apple({
    required this.onPressed,
    super.key,
  }) : type = AppSignInButtonType.apple;

  final VoidCallback onPressed;
  final AppSignInButtonType type;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type.icon,
          const SizedBox(width: 10),
          Text(
            type.label,
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.canvasColor,
            ),
          )
        ],
      ),
    );
  }
}
