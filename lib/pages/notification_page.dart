import 'package:flutter/material.dart';
import 'package:lulu_chat/core/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.getItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas notificações"),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: service.getItemsCount,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(items[i].title),
          subtitle: Text(items[i].body),
          onTap: () => service.remove(i),
        ),
      ),
    );
  }
}