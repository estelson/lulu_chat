import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:lulu_chat/core/models/chat_notification.dart';

class ChatNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];

  int get getItemsCount {
    return _items.length;
  }

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

  // Push notification
  Future<void> init() async {
    _configureTerminated();
    _configureForeground();
    _configureBackground();
  }

  Future<bool> get _isAuthorized async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<void> _configureTerminated() async {
    if (await _isAuthorized) {
      RemoteMessage? initialMsg = await FirebaseMessaging.instance.getInitialMessage();
      _messageHandler(initialMsg);
    }
  }

  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen(_messageHandler);
    }
  }

  Future<void> _configureBackground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessageOpenedApp.listen(_messageHandler);
    }
  }

  void _messageHandler(RemoteMessage? msg) {
    if(msg == null || msg.notification == null) return;

    add(ChatNotification(
      title: msg.notification!.title! ?? "Não informado!",
      body: msg.notification!.body! ?? "Não informado!",
    ));
  }
}