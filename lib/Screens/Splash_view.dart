import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash.jpg"),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.8),
          ),
          Center(
            child: Image.asset(
              "assets/images/logow.png",
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customButton(
                  onPressed: () {},
                  text: "Log In",
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                SizedBox(height: 20),
                customButton(
                  onPressed: () {},
                  text: "Sign Up",
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  filled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
