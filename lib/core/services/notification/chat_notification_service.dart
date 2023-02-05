import 'package:flutter/cupertino.dart';
import 'package:lulu_chat/core/models/chat_notification.dart';

class ChatNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];

  List<ChatNotification> get getItems {
    return [..._items];
  }

  void add(ChatNotification notification) {
    _items.add(notification);

    notifyListeners();
  }

  void remove(int i) {
    _items.removeAt(i);

    notifyListeners();
  }
}