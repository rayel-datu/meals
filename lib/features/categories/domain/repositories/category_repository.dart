import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_life_exam/app/error/meal_exceptions.dart';
import 'package:uni_life_exam/app/data/meal_api.dart';
import 'package:uni_life_exam/features/categories/entities/models/category_model.dart';

class CategoryRepository {
  CategoryRepository({MealApi? mealApi})
    : mealApi = mealApi ?? GetIt.instance.get<MealApi>();

  @visibleForTesting
  final MealApi mealApi;

  @visibleForTesting
  List<CategoryModel>? categories;

  /// Get categories either from memory [categories] or from internet by setting [refresh] to true
  Future<List<CategoryModel>> getCategories({bool refresh = false}) async {
    try {
      if (categories == null || refresh) {
        final dto = await mealApi.getCategories();

        if (dto.categories.isEmpty) {
          throw EmptyResponseException();
        }

        categories =
            dto.categories.map((e) => CategoryModel.fromDto(e)).toList();
      }
      return categories ?? [];
    } on MealException {
      rethrow;
    } catch (e) {
      throw UnknownMealException();
    }
  }
}
