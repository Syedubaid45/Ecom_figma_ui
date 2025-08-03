import 'package:flutter/material.dart';

Widget SizeSelector({
  required List<double> sizes,
  required double selectedSize,
  required ValueChanged<double> onSizeSelected,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        children: sizes.map((size) {
          final isSelected = size == selectedSize;

          return GestureDetector(
            onTap: () => onSizeSelected(size),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey.shade400,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Text(
                size.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
