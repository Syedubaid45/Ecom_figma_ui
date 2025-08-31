import 'package:figma_ecom_ui/Screens/Main_view.dart';
import 'package:figma_ecom_ui/Screens/successfull_signup_view.dart';
import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:figma_ecom_ui/Widgets/Custom_textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _agreeToTerms = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  signup(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final username = usernameController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match.')));
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must agree to the terms first.')),
      );
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessfullSignupView()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Create an account to continue",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: usernameController,
                  label: "Username",
                  hintText: "Enter your username",
                  obscureText: false,
                  suffixIcon: Icons.person,
                ),
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

                CustomTextField(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  hintText: "Enter your Confirm Password",
                  obscureText: true,
                  suffixIcon: Icons.lock,
                ),

                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.black,
                      fillColor: MaterialStateProperty.all(Colors.white),
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "By Creating an account you have to agree with our Terms and Conditions.",
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                customButton(
                  onPressed: () {
                    signup(context);
                  },
                  text: "Sign Up",
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
