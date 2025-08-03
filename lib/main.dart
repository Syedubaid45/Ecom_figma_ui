import 'package:figma_ecom_ui/Screens/Home_view.dart';
import 'package:figma_ecom_ui/Screens/Splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Figma E-Commerce UI',
      home: SplashView(),
    );
  }
}
