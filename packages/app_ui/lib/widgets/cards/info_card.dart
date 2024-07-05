import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

enum AppInfoCardType {
  info(),
  loading(),
  warning(),
  success();

  Color get cardColor {
    return switch (this) {
      AppInfoCardType.info || AppInfoCardType.loading => Colors.blue.shade200,
      AppInfoCardType.warning => Colors.redAccent.shade200,
      AppInfoCardType.success => Colors.lightGreen.shade200,
    };
  }

  Widget get icon {
    return switch (this) {
      AppInfoCardType.loading ||
      AppInfoCardType.info =>
        Assets.images.loadingPaw.image(
          width: 60,
          fit: BoxFit.fill,
        ),
      AppInfoCardType.warning => Assets.animations.error.lottie(
          repeat: false,
          width: 60,
          fit: BoxFit.fill,
        ),
      AppInfoCardType.success => Assets.animations.success.lottie(
          repeat: false,
          width: 60,
          fit: BoxFit.fill,
        ),
    };
  }
}

class AppInfoCard extends StatelessWidget {
  const AppInfoCard.info({
    required this.text,
    super.key,
  }) : _type = AppInfoCardType.info;

  const AppInfoCard.loading({
    required this.text,
    super.key,
  }) : _type = AppInfoCardType.loading;

  const AppInfoCard.warning({
    required this.text,
    super.key,
  }) : _type = AppInfoCardType.warning;

  const AppInfoCard.success({
    required this.text,
    super.key,
  }) : _type = AppInfoCardType.success;

  final String text;
  final AppInfoCardType _type;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: _type.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            _type.icon,
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
