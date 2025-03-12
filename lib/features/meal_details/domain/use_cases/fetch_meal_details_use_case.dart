import 'package:get_it/get_it.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meal_details/entities/models/meal_details_model.dart';

class FetchMealDetailUseCase {
  FetchMealDetailUseCase({MealRepository? mealRepository})
    : mealRepository = mealRepository ?? GetIt.instance.get<MealRepository>();

  final MealRepository mealRepository;

  Future<List<MealDetailsModel>> execute(
    String id, [
    bool refresh = false,
  ]) async => await mealRepository.getMealDetailsById(id, refresh: refresh);
}
