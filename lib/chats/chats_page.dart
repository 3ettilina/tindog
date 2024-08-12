import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/chats/bloc/chats_bloc.dart';
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
    context.read<ChatsBloc>().add(const FetchChats());
    return Column(
      children: [
        AppHeader(label: label),
        const SizedBox(height: 12),
        const Expanded(
          child: ChatsView(),
        ),
      ],
    );
  }
}
