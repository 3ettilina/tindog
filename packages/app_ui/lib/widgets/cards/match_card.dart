import 'package:app_ui/app_ui.dart';
import 'package:app_ui/widgets/buttons/app_outlined_button.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    required this.myDogName,
    required this.myDogImageUrl,
    required this.likedDogName,
    required this.likedDogImageUrl,
    required this.onPrimaryTap,
    required this.onSecondaryTap,
    super.key,
  });

  final String myDogName;
  final String myDogImageUrl;
  final String likedDogName;
  final String likedDogImageUrl;
  final VoidCallback onPrimaryTap;
  final VoidCallback onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'It\'s a match!',
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '🐾✨',
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(height: 22),
            Text(
              '$myDogName and $likedDogName like each other 🤗',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Assets.animations.confetti.lottie(
                    width: 300,
                    repeat: true,
                  ),
                  Positioned(
                    top: 25,
                    left: 15,
                    child: AppCircularImage.url(
                      url: myDogImageUrl,
                      size: 140,
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 25,
                    child: AppCircularImage.url(
                      url: likedDogImageUrl,
                      size: 140,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            AppFilledButton(
              label: 'Go to chats',
              onPressed: onPrimaryTap,
            ),
            const SizedBox(height: 16),
            AppOutlinedButton(
              label: 'Keep swiping',
              onPressed: onSecondaryTap,
            )
          ],
        ),
      ),
    );
  }
}
