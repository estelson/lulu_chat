import 'dart:io';

import 'package:lulu_chat/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get getCurrentUser;

  Stream<ChatUser?> get getUserChanges;

  Future<void> signup(String name, String email, String password, File image);

  Future<void> login(String email, String password);

  Future<void> logout();
}