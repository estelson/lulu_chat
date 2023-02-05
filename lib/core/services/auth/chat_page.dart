import 'package:flutter/material.dart';
import 'package:lulu_chat/components/messages.dart';
import 'package:lulu_chat/components/new_message.dart';
import 'package:lulu_chat/core/services/auth/auth_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lulu Chat"),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                value: "logout",
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text("Sair"),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              if (value == "logout") {
                AuthService().logout();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Chat page"),
      //       TextButton(
      //         onPressed: () {
      //           AuthService().logout();
      //         },
      //         child: Text("Logout"),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}