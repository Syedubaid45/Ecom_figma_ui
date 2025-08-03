import 'package:flutter/material.dart';

Widget ProductImageSection() {
  return Stack(
    children: [
      Center(child: Image(image: AssetImage("assets/images/icon1.webp"))),
      Positioned(
        top: 10,
        left: 10,
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: IconButton(
          icon: Icon(Icons.shopping_bag_outlined),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    ],
  );
}
