import 'package:flutter/material.dart';

Widget ColorSelector({
  required List<int> colors,
  required int selectedColor,
  required ValueChanged<int> onColorSelected,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, right: 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        children: colors.map((colorValue) {
          final isSelected = colorValue == selectedColor;

          return GestureDetector(
            onTap: () => onColorSelected(colorValue),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(colorValue),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey.shade400,
                  width: isSelected ? 2.5 : 1.0,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
