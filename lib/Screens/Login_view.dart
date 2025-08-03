import 'package:figma_ecom_ui/Screens/Main_view.dart';
import 'package:flutter/material.dart';
import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:figma_ecom_ui/Widgets/Custom_textFormField.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  login(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logob.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Please log in or Sign up to continue our app",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 40),
                CustomTextField(
                  label: "Email",
                  hintText: "Enter your email",
                  suffixIcon: Icons.email,
                ),
                CustomTextField(
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                  suffixIcon: Icons.lock,
                ),

                const SizedBox(height: 20),
                customButton(
                  onPressed: () {
                    login(context);
                  },
                  text: "Login",
                  color: Colors.black,
                  textColor: Colors.white,
                ),

                const SizedBox(height: 16),
                const Center(
                  child: Text("or", style: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    customButton(
                      onPressed: () {},
                      text: "Continue with Facebook",
                      icon: Icons.facebook,
                      color: Colors.blue,
                      textColor: Colors.white,
                      borderColor: Colors.blue.shade700,
                      filled: true,
                    ),
                    const SizedBox(height: 12),
                    customButton(
                      onPressed: () {},
                      text: "Continue with Google",
                      icon: Icons.g_mobiledata,
                      color: Colors.white,
                      textColor: Colors.black,
                      borderColor: Colors.grey.shade300,
                      filled: false,
                    ),
                    const SizedBox(height: 12),
                    customButton(
                      onPressed: () {},
                      text: "Continue with Apple",
                      icon: Icons.apple,
                      color: Colors.white,
                      textColor: Colors.black,
                      borderColor: Colors.grey.shade300,
                      filled: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
