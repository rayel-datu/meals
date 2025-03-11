import 'package:get_it/get_it.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';

class FetchMealsUseCase {
  FetchMealsUseCase({MealRepository? mealRepository})
    : mealRepository = mealRepository ?? GetIt.instance.get<MealRepository>();

  final MealRepository mealRepository;

  Future<List<MealItemModel>> execute(
    String category, [
    bool refresh = false,
  ]) async =>
      await mealRepository.getMealsByCategory(category, refresh: refresh);
}
