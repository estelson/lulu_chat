import 'package:flutter/material.dart';
import 'package:lulu_chat/core/models/chat_user.dart';
import 'package:lulu_chat/core/services/auth/auth_service.dart';
import 'package:lulu_chat/core/services/notification/chat_notification_service.dart';
import 'package:lulu_chat/pages/chat_page.dart';
import 'package:lulu_chat/pages/auth_page.dart';
import 'package:lulu_chat/pages/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    await Provider.of<ChatNotificationService>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          return StreamBuilder<ChatUser?>(
            stream: AuthService().getUserChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              } else {
                return snapshot.hasData ? ChatPage() : AuthPage();
              }
            },
          );
        }
      }
    );
  }
}