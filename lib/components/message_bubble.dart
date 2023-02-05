import 'package:flutter/material.dart';
import 'package:lulu_chat/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser; // Controla se a mensagem pertence ao usuário logado ou ao outro participante do chat

  const MessageBubble({Key? key, required this.message, required this.belongsToCurrentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurrentUser ? Colors.grey.shade300 : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          width: 180,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Text(
                message.userName,
                style: TextStyle(
                  color: belongsToCurrentUser ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                style: TextStyle(
                  color: belongsToCurrentUser ? Colors.black : Colors.white,
                ),
                message.text,
              ),
            ],
          ),
        ),
      ],
    );
  }
}