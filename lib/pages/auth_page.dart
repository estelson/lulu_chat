import 'package:flutter/material.dart';
import 'package:lulu_chat/components/auth_form.dart';
import 'package:lulu_chat/models/auth_form_data.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData authFormData) async{
    try {
      setState(() => _isLoading = true);

      if(authFormData.isLogin) {
        // login
      } else {
        // Signup
      }
    } on Exception catch (e) {
      // TODO: tratar o erro
    } finally {
      setState(() => _isLoading = false);
    }

    // debugPrint("AuthPage...");
    // debugPrint(authFormData.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}