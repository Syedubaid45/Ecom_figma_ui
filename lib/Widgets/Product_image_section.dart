import 'package:figma_ecom_ui/Screens/Cart_view.dart';
import 'package:flutter/material.dart';
import '../Data/products_data.dart';

Widget ProductImageSection(int index, BuildContext context) {
  void cart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartView()),
    );
  }

  return Stack(
    children: [
      Center(child: Image.asset(products[index]["image"])),
      Positioned(
        top: 10,
        left: 10,
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: IconButton(
          icon: Icon(Icons.shopping_bag_outlined),
          color: Colors.white,
          onPressed: () {
            cart();
          },
        ),
      ),
    ],
  );
}
