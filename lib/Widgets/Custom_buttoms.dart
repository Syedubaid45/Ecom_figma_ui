import 'package:flutter/material.dart';

Widget customButton({
  required VoidCallback onPressed,
  required String text,
  bool filled = true,
  Color color = Colors.black,
  Color textColor = Colors.white,
  Color borderColor = Colors.black,
  IconData? icon,
}) {
  final style = ButtonStyle(
    elevation: MaterialStateProperty.all(filled ? 4 : 0),
    backgroundColor: MaterialStateProperty.all(
      filled ? color : Colors.transparent,
    ),
    foregroundColor: MaterialStateProperty.all(textColor),
    side: filled
        ? null
        : MaterialStateProperty.all(BorderSide(color: borderColor, width: 2)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );

  final buttonChild = icon != null
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 8),
            Text(text),
          ],
        )
      : Text(text);

  return SizedBox(
    width: double.infinity,
    height: 55,
    child: filled
        ? ElevatedButton(onPressed: onPressed, style: style, child: buttonChild)
        : OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: buttonChild,
          ),
  );
}
