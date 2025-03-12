import 'package:flutter/material.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';
import 'package:meal_app/features/categories/presentation/atoms/category_item.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_card.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return MealCard(
      child: CategoryItem(
        description: categoryModel.description,
        imageUrl: categoryModel.thumbnail,
        title: categoryModel.category,
      ),
    );
  }
}
