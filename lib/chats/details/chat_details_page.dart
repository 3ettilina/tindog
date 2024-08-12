import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/chats/bloc/chats_bloc.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({
    required this.label,
    required this.chatId,
    super.key,
  });

  final String label;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$chatId'),
      ),
      body: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          return ListView.builder(itemBuilder: (context, index) {});
        },
      ),
    );
  }
}
