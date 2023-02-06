import 'package:flutter/material.dart';
import 'package:lulu_chat/pages/auth_or_app_page.dart';
import 'package:lulu_chat/core/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue,
            secondary: Colors.white,
            error: Colors.red,
          ),
          // canvasColor: Color.fromRGBO(220, 234, 255, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 20,
                ),
              ),
        ),
        home: AuthOrAppPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}