import 'package:flutter/material.dart';
import 'package:meal_app/features/meal_details/entities/models/meal_details_model.dart';
import 'package:meal_app/features/meal_details/presentation/atoms/meal_details_row.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_card.dart';

class MealDetailsIngredients extends StatelessWidget {
  const MealDetailsIngredients({super.key, required this.ingredients});

  final List<MealIngredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MealCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => MealDetailsRow(
                    label: '${ingredients[index].ingredient}:',
                    text: ingredients[index].measurement,
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: ingredients.length,
            ),
          ],
        ),
      ),
    );
  }
}
