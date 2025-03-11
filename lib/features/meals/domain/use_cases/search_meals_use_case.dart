import 'package:get_it/get_it.dart';
import 'package:meal_app/app/utilities/search_mixin.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';

class SearchMealsUseCase with SearchMixin<MealItemModel> {
  SearchMealsUseCase({MealRepository? mealRepository})
    : mealRepository = mealRepository ?? GetIt.instance.get<MealRepository>();

  final MealRepository mealRepository;

  Future<List<MealItemModel>> execute(
    String category, {
    required String keyword,
  }) async {
    final source = await mealRepository.getMealsByCategory(
      category,
      refresh: false,
    );

    return search(source, keyword);
  }
}
