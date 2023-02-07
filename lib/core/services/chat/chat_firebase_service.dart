import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lulu_chat/core/models/chat_message.dart';
import 'package:lulu_chat/core/models/chat_user.dart';
import 'package:lulu_chat/core/services/chat/chat_service.dart';

class ChatFirebaseService implements ChatService {
  Stream<List<ChatMessage>> messagesStream() {
    return Stream<List<ChatMessage>>.empty();
  }

  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    // Transforma ChatMessage => Map<String, dynamic> para ser enviado ao Firebase Firestore
    store.collection("chat").add({
      "text": text,
      "createdAt": DateTime.now().toIso8601String(),
      "userId": user.id,
      "userName": user.name,
      "userImageUrl": user.imageUrl,
    });

    return null;
  }

// final newMessage = ChatMessage(
//       id: Random().nextDouble().toString(),
//       text: text,
//       createdAt: DateTime.now(),
//       userId: user.id,
//       userName: user.name,
//       userImageUrl: user.imageUrl,
//     );
//
//     _msgs.add(newMessage);
//
//     _controller?.add(_msgs.reversed.toList());
}