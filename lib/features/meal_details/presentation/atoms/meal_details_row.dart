import 'package:flutter/material.dart';

class MealDetailsRow extends StatelessWidget {
  const MealDetailsRow({super.key, required this.label, required this.text});

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8),
        Flexible(child: Text(text, style: TextStyle(fontSize: 16))),
      ],
    );
  }
}
