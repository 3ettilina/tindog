import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.label,
    this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.hintColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
