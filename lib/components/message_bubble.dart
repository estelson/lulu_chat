import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lulu_chat/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = "assets/images/avatar.png";
  final ChatMessage message;
  final bool belongsToCurrentUser; // Controla se a mensagem pertence ao usuário logado ou ao outro participante do chat

  const MessageBubble({Key? key, required this.message, required this.belongsToCurrentUser}) : super(key: key);

  Widget _showUserImage(String imageUrl) {
    ImageProvider? provider;

    final uri = Uri.parse(imageUrl);
    
    if(uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if(uri.scheme.contains("http")) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: belongsToCurrentUser ? Colors.grey.shade300 : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: belongsToCurrentUser ? Radius.circular(12) : Radius.circular(0),
                  bottomRight: belongsToCurrentUser ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: 180,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: belongsToCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.userName,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    textAlign: belongsToCurrentUser ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                    ),
                    message.text,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToCurrentUser ? null : 165,
          right: belongsToCurrentUser ? 165 : null,
          child: _showUserImage(message.userImageUrl),
        ),
      ],
    );
  }
}