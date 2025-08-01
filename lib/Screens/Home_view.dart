import 'package:figma_ecom_ui/Screens/Cart_view.dart';
import 'package:figma_ecom_ui/Screens/Main_view.dart';
import 'package:figma_ecom_ui/Screens/Notification_view.dart';
import 'package:figma_ecom_ui/Screens/Profile_view.dart';
import 'package:figma_ecom_ui/Widgets/Custom_bottomNavBar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    MainView(),
    CartView(),
    NotificationView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Drawer(
            backgroundColor: Colors.white,
            child: Icon(Icons.menu, color: Colors.black),
          ),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IndexedStack(index: _selectedIndex, children: _pages),
        ),
      ),
    );
  }
}
