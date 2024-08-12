import 'package:app_ui/app_ui.dart';
import 'package:core/entities/chat/chat_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/chats/bloc/chats_bloc.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return switch (state) {
          ChatsLoading() => Center(
              child: Assets.images.loadingPaws.image(width: 80),
            ),
          ChatsReady() => _ChatsList(state.chats),
          ChatsError() => Center(
              child: Assets.animations.error.lottie(width: 80),
            ),
        };
      },
    );
  }
}

class _ChatsList extends StatelessWidget {
  const _ChatsList(this.chats);

  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: AppCircularImage.url(
              url: chat.otherDog.thumbnailUrl,
              size: 70,
            ),
            title: Text(
              chat.otherDog.name,
              style: context.textTheme.titleLarge,
            ),
            subtitle: Text(
              chat.latestMessage?.text ?? chat.initialChatMessage.text,
              maxLines: 2,
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              children: [
                Text(
                  '${chat.updatedAt.hour}:${chat.updatedAt.minute}',
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                const Icon(Icons.chevron_right_outlined),
              ],
            ),
          );
        });
  }
}
