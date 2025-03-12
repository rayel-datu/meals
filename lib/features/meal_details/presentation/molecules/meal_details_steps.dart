import 'package:flutter/material.dart';
import 'package:meal_app/features/meal_details/presentation/atoms/meal_details_step.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_card.dart';

class MealDetailsSteps extends StatelessWidget {
  const MealDetailsSteps({super.key, required this.instructions});

  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to cook',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Flexible(
            child: ListView.separated(
              itemCount: instructions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder:
                  (context, index) => MealCard(
                    child: MealDetailsStep(
                      step: instructions[index],
                      stepNo: index + 1,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
