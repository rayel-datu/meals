import 'package:flutter/material.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:meal_app/features/meals/presentation/molecules/meal_list_item.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_list.dart';

class MealItemList extends StatelessWidget {
  const MealItemList({super.key, required this.meals, required this.category});

  final List<MealItemModel> meals;
  final String category;

  @override
  Widget build(BuildContext context) {
    return MealList(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder:
          (context, index) =>
              MealListItem(mealItemModel: meals[index], category: category),
      itemCount: meals.length,
    );
  }
}
