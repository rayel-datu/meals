import 'package:flutter/material.dart';
import 'package:meal_app/features/meal_details/presentation/atoms/meal_details_row.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_card.dart';

class MealDetailsInfo extends StatelessWidget {
  const MealDetailsInfo({
    super.key,
    required this.category,
    required this.country,
  });

  final String category;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MealCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MealDetailsRow(label: 'Category:', text: category),
            MealDetailsRow(label: 'Country:', text: country),
          ],
        ),
      ),
    );
  }
}
