import 'package:figma_ecom_ui/Screens/Home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:figma_ecom_ui/Widgets/Custom_textFormField.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password.')),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is invalid.';
      } else if (e.code == 'user-disabled') {
        message = 'This account has been disabled.';
      } else {
        message = 'Unexpected error: ${e.message}';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
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
                    "assets/images/1log.png",
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
                  controller: emailController,
                  label: "Email",
                  hintText: "Enter your email",
                  suffixIcon: Icons.email,
                ),
                CustomTextField(
                  controller: passwordController,
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
