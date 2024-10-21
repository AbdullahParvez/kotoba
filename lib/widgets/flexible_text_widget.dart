import 'package:flutter/material.dart';

class FlexibleTextWidget extends StatelessWidget {
  const FlexibleTextWidget({
    super.key,
    required this.text,
    required this.fontSize
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}