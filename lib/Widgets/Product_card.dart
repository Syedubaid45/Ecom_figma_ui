import 'package:flutter/material.dart';
import 'package:figma_ecom_ui/Data/products_data.dart';

Widget productCard(BuildContext context, int index) {
  final product = products[index];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          product['image'],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      ),
      const SizedBox(height: 6),

      Text(
        product['name'],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        '${product['description']}',
        style: const TextStyle(color: Colors.grey, fontSize: 13),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        '\$${product['price'].toStringAsFixed(2)}',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
