import 'package:flutter/material.dart';

Widget ProductTitleAndRating({
  required String title,
  required String subtitle,
  required double rating,
  required int reviews,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(fontSize: 14)),
        Row(
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating.floor() ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "$reviews Reviews",
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}
