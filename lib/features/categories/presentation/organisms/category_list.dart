import 'package:flutter/material.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';
import 'package:meal_app/features/categories/presentation/molecules/category_list_item.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_list.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return MealList(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder:
          (context, index) =>
              CategoryListItem(categoryModel: categories[index]),
      itemCount: categories.length,
    );
  }
}
