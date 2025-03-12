import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:meal_app/features/meals/presentation/atoms/meal_item.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_card.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.mealItemModel,
    required this.category,
  });

  final MealItemModel mealItemModel;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.pushNamed(
            'mealDetails',
            pathParameters: {'mealId': mealItemModel.id, 'category': category},
          ),
      child: MealCard(
        child: MealItem(
          imageUrl: mealItemModel.thumbnail,
          title: mealItemModel.name,
        ),
      ),
    );
  }
}
