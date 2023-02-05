import 'package:flutter/material.dart';
import 'package:lulu_chat/core/services/auth/auth_mock_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat page"),
            TextButton(
              onPressed: () {
                AuthMockService().logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}