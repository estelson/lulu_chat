import 'package:flutter/material.dart';
import 'package:lulu_chat/components/auth_form.dart';
import 'package:lulu_chat/core/models/auth_form_data.dart';
import 'package:lulu_chat/core/services/auth/auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData authFormData) async {
    try {
      setState(() => _isLoading = true);

      if (authFormData.isLogin) {
        // login
        await AuthService().login(authFormData.email, authFormData.password);
      } else {
        // Signup
        await AuthService().signup(authFormData.name, authFormData.email, authFormData.password, authFormData.image);
      }
    } on Exception catch (e) {
      // TODO: tratar o erro
    } finally {
      if (!mounted) return;

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