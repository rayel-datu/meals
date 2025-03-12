import 'package:meal_app/features/categories/entities/dto/category_dto.dart';
import 'package:meal_app/features/meal_details/entities/dtos/meal_details_dto.dart';
import 'package:meal_app/features/meals/entities/dto/meal_item_dto.dart';

abstract class MealApi {
  Future<CategoryDto> getCategories();
  Future<MealDto> getMeals(String category);
  Future<MealDetailsDto> getMealDetailsById(String id);
}
