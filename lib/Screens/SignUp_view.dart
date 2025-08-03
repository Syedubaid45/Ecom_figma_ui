import 'package:figma_ecom_ui/Screens/Main_view.dart';
import 'package:figma_ecom_ui/Screens/successfull_signup_view.dart';
import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:figma_ecom_ui/Widgets/Custom_textFormField.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _agreeToTerms = false;

  signup(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SuccessfullSignupView()),
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
                  label: "Username",
                  hintText: "Enter your username",
                  obscureText: false,
                  suffixIcon: Icons.person,
                ),
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

                CustomTextField(
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
