import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lulu_chat/components/user_image_picker.dart';
import 'package:lulu_chat/core/models/auth_form_data.dart';
import 'package:validatorless/validatorless.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _authFormData = AuthFormData();

  void _handleImagePick(File image) {
    _authFormData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate() ?? false;
    if (!isValid) return;

    if (_authFormData.image == null && _authFormData.isSignup) {
      return _showError("Selecione uma imagem");
    }

    widget.onSubmit(_authFormData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_authFormData.isSignup)
                UserImagePicker(
                  onImagePick: _handleImagePick,
                ),
              if (_authFormData.isSignup)
                TextFormField(
                  key: ValueKey("name"),
                  initialValue: _authFormData.name,
                  onChanged: (name) => _authFormData.name = name,
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: Validatorless.multiple([
                    Validatorless.required("O campo 'Nome' é obrigatório"),
                    Validatorless.min(5, "O campo 'Nome' deve conter no mínimo 5 caracteres"),
                    Validatorless.max(50, "O campo 'Nome' deve conter no máximo 50 caracteres"),
                  ]),
                ),
              TextFormField(
                key: ValueKey("email"),
                initialValue: _authFormData.email,
                onChanged: (email) => _authFormData.email = email,
                decoration: InputDecoration(labelText: "e-Mail"),
                validator: Validatorless.multiple([
                  Validatorless.required("O campo 'e-Mail' é obrigatório"),
                  Validatorless.email("e-Mail inválido"),
                ]),
              ),
              TextFormField(
                key: ValueKey("password"),
                initialValue: _authFormData.password,
                onChanged: (password) => _authFormData.password = password,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
                validator: Validatorless.multiple([
                  Validatorless.required("O campo 'Senha' é obrigatório"),
                  Validatorless.min(6, "O campo 'Senha' deve conter no mínimo 6 caracteres"),
                ]),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_authFormData.isLogin ? "Entrar" : "Cadastrar"),
              ),
              TextButton(
                child: Text(_authFormData.isLogin ? "Criar uma nova conta?" : "Já possui conta?"),
                onPressed: () {
                  setState(() {
                    _authFormData.toggleAuthMode();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}