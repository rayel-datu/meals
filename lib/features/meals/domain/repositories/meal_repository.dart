import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_life_exam/app/data/meal_api.dart';
import 'package:uni_life_exam/app/error/meal_exceptions.dart';
import 'package:uni_life_exam/features/meals/entities/models/meal_details_model.dart';
import 'package:uni_life_exam/features/meals/entities/models/meal_item_model.dart';

class MealRepository {
  MealRepository({MealApi? mealApi})
    : mealApi = mealApi ?? GetIt.instance.get<MealApi>();
  final MealApi mealApi;

  @visibleForTesting
  Map<String, List<MealItemModel>> mealsCache = {};

  @visibleForTesting
  Map<String, List<MealDetailsModel>> mealDetailsCache = {};

  /// Get categories either from memory [mealsCache] or from internet by setting [refresh] to true
  Future<List<MealItemModel>> getMealsByCategory(
    String category, {
    bool refresh = false,
  }) async {
    try {
      if (!mealsCache.containsKey(category) || refresh) {
        final dto = await mealApi.getMeals(category);

        if (dto.meals.isEmpty) {
          throw EmptyResponseException();
        }

        final meals = dto.meals.map((e) => MealItemModel.fromDto(e)).toList();

        // update in memory cache
        mealsCache.update(
          category,
          (value) => meals,
          ifAbsent: () => mealsCache.putIfAbsent(category, () => meals),
        );
      }

      // safe to use `!` it was checked before
      return mealsCache[category]!;
    } on MealException {
      rethrow;
    } catch (e) {
      throw UnknownMealException();
    }
  }

  /// Get categories either from memory [mealsCache] or from internet by setting [refresh] to true
  Future<List<MealDetailsModel>> getMealDetailsById(
    String id, {
    bool refresh = false,
  }) async {
    try {
      if (!mealsCache.containsKey(id) || refresh) {
        final dto = await mealApi.getMealDetailsById(id);

        if (dto.meals.isEmpty) {
          throw EmptyResponseException();
        }

        final meals =
            dto.meals.map((e) => MealDetailsModel.fromDto(e)).toList();

        // update in memory cache
        mealDetailsCache.update(
          id,
          (value) => meals,
          ifAbsent: () => mealDetailsCache.putIfAbsent(id, () => meals),
        );
      }

      // safe to use `!` it was checked before
      return mealDetailsCache[id]!;
    } on MealException {
      rethrow;
    } catch (e) {
      throw UnknownMealException();
    }
  }
}
