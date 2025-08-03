import 'package:figma_ecom_ui/Screens/Main_view.dart';
import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:flutter/material.dart';

class SuccessfullSignupView extends StatelessWidget {
  const SuccessfullSignupView({super.key});

  Shopping(context) {
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: 50),
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: MediaQuery.of(context).size.width * 0.25,
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Text(
                      "Successful!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "You have Successfully registered in our app and start working in it.",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 100),
                customButton(
                  onPressed: () {
                    Shopping(context);
                  },
                  text: "Start Shopping",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
