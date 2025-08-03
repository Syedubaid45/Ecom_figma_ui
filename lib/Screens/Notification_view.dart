import 'package:figma_ecom_ui/Data/notifications_data.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: promoNotifications.length,
        itemBuilder: (context, index) {
          final promo = promoNotifications[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.redAccent),
              title: Text(promo['title']!),
              subtitle: Text(promo['message']!),
            ),
          );
        },
      ),
    );
  }
}
