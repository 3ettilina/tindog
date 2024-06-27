import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({
    required this.label,
    required this.detailsPath,
    super.key,
  });

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          label: label,
          caption: '📍Berlin, Germany',
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DogsSwipper(
              dogs: [
                Assets.images.toro.provider(),
                Assets.images.toro.provider(),
                Assets.images.toro.provider(),
                Assets.images.toro.provider(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Assets.images.nope.image(width: 50),
              ),
              IconButton(
                onPressed: () {},
                icon: Assets.images.like.image(width: 50),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
