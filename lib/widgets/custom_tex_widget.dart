import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final bool bold;
  const CustomText(
      {super.key, required this.text, this.size, this.color, this.bold = true});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'CircularStd',
            fontSize: size,
            color: color,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal));
  }
}
