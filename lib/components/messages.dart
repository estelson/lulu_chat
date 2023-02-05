import 'package:flutter/material.dart';
import 'package:lulu_chat/components/message_bubble.dart';
import 'package:lulu_chat/core/models/chat_message.dart';
import 'package:lulu_chat/core/services/auth/auth_service.dart';
import 'package:lulu_chat/core/services/chat/chat_service.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().getCurrentUser;

    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "Ainda não existem mensagens aqui.\nVamos conversar?",
              textAlign: TextAlign.center,
            ),
          );
        } else {
          final msgs = snapshot.data!;

          return ListView.builder(
            reverse: true,
            physics: BouncingScrollPhysics(),
            itemCount: msgs.length,
            itemBuilder: (ctx, i) => MessageBubble(
              key: ValueKey(msgs[i]),
              message: msgs[i],
              belongsToCurrentUser: currentUser?.id == msgs[i].userId,
            ),
          );
        }
      },
    );
  }
}