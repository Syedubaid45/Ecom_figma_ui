import 'package:figma_ecom_ui/Widgets/Color_selector.dart';
import 'package:figma_ecom_ui/Widgets/Custom_buttoms.dart';
import 'package:figma_ecom_ui/Widgets/Product_image_section.dart';
import 'package:figma_ecom_ui/Widgets/Product_title_and_rating.dart';
import 'package:figma_ecom_ui/Widgets/Size_selector.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late double selectedSize;
  late int selectedColor;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product['selectedSize'];
    selectedColor = widget.product['selectedColor'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSection(),
            ProductTitleAndRating(
              title: widget.product['name'],
              rating: widget.product['rating'],
              reviews: widget.product['reviews'],
              subtitle: widget.product["description"],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Size Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizeSelector(
                        sizes: List<double>.from(widget.product['sizes']),
                        selectedSize: selectedSize,
                        onSizeSelected: (size) {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ColorSelector(
                        colors: List<int>.from(widget.product['colors']),
                        selectedColor: selectedColor,
                        onColorSelected: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product["description"],
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TOTAL PRICE",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  "\$${(widget.product["price"] as num).toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              width: 160,

              child: customButton(
                onPressed: () {},
                text: "Add to cart",
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
