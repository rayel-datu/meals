import 'package:flutter/material.dart';

class MealDetailsStep extends StatelessWidget {
  const MealDetailsStep({super.key, required this.step, required this.stepNo});

  final int stepNo;
  final String step;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step $stepNo:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8),
        Flexible(
          child: SingleChildScrollView(
            child: Text(step, style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
