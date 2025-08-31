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

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const MainView();
      case 1:
        return CartView();
      case 2:
        return const NotificationView();
      case 3:
        return const ProfileScreen();
      default:
        return const MainView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _getPage(_selectedIndex),
        ),
      ),
    );
  }
}
