import 'package:flutter/widgets.dart';
import 'package:uni_life_exam/app/error/meal_exceptions.dart';
import 'package:uni_life_exam/features/categories/data/meal_api.dart';
import 'package:uni_life_exam/features/categories/entities/models/category_model.dart';

class CategoryRepository {
  CategoryRepository(this.mealApi);

  @visibleForTesting
  final MealApi mealApi;

  List<CategoryModel>? _categories;

  /// Get categories either from memory [_categories] or from internet by setting [refresh] to true
  Future<List<CategoryModel>> getCategories({bool refresh = false}) async {
    try {
      if (_categories == null || refresh) {
        final dto = await mealApi.getCategories();
      }
      return _categories ?? [];
    } catch (e) {
      throw UnknownMealException();
    }
  }
}
