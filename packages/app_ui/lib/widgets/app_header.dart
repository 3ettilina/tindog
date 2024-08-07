import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    required this.label,
    this.caption,
    super.key,
  });

  final String label;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              color: context.theme.primaryColor),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.textTheme.headlineLarge!.copyWith(
                    color: context.theme.canvasColor,
                  ),
                ),
                const SizedBox(height: 4),
                if (caption != null)
                  Text(
                    caption!,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.theme.canvasColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
