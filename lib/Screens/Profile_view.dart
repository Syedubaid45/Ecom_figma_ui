import 'package:flutter/material.dart';
import 'package:figma_ecom_ui/Data/Cart_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.person, "title": "Personal Details"},
      {"icon": Icons.shopping_bag, "title": "My Order"},
      {"icon": Icons.favorite, "title": "My Favourites"},
      {"icon": Icons.location_on, "title": "Shipping Address"},
      {"icon": Icons.credit_card, "title": "My Card"},
      {"icon": Icons.settings, "title": "Settings"},
    ];

    final List<Map<String, dynamic>> footerItems = [
      {"icon": Icons.help_outline, "title": "FAQs"},
      {"icon": Icons.privacy_tip_outlined, "title": "Privacy Policy"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=12",
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Fscreation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Fscreation441@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
              ),
              child: ListView.separated(
                itemCount: menuItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(menuItems[index]['icon']),
                    title: Text(
                      menuItems[index]['title'],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
              ),
              child: ListView.separated(
                itemCount: footerItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(footerItems[index]['icon']),
                    title: Text(
                      footerItems[index]['title'],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
