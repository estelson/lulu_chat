import 'package:flutter/material.dart';
import 'package:lulu_chat/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AuthForm(),
        ),
      ),
    );
  }
}