import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:tindog/chats/view/chats_view.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({
    required this.label,
    required this.chatDetailsPath,
    super.key,
  });

  final String label;
  final String chatDetailsPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(label: label),
        const ChatsView(),
      ],
    );
  }
}
