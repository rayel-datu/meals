import 'package:flutter/material.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:meal_app/features/meals/presentation/atoms/meal_item.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_card.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.mealItemModel});

  final MealItemModel mealItemModel;

  @override
  Widget build(BuildContext context) {
    return MealCard(
      child: MealItem(
        imageUrl: mealItemModel.thumbnail,
        title: mealItemModel.name,
      ),
    );
  }
}
