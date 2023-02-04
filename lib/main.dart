import 'package:flutter/material.dart';
import 'package:lulu_chat/pages/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.white,
          error: Colors.red,
        ),
        canvasColor: Color.fromRGBO(214, 234, 241, 1.0),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
              ),
            ),
      ),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}