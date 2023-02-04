import 'dart:io';

import 'package:lulu_chat/core/models/chat_user.dart';
import 'package:lulu_chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  ChatUser? get getCurrentUser {
    return null;
  }

  Stream<ChatUser?> get getUserChanges {}

  Future<void> signup(String name, String email, String password, File image) async {}

  Future<void> login(String email, String password) async {}

  Future<void> logout() async {}
}