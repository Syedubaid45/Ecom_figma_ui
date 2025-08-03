import 'package:figma_ecom_ui/Data/products_data.dart';
import 'package:figma_ecom_ui/Screens/Product_view.dart';
import 'package:figma_ecom_ui/Widgets/Product_card.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductView(product: products[index]),
                      ),
                    );
                  },
                  child: productCard(context, index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
