import 'package:figma_ecom_ui/Data/notifications_data.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
