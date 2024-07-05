import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(label: label),
      ],
    );
  }
}
