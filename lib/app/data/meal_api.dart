import 'package:uni_life_exam/features/categories/entities/dto/category_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_details_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_item_dto.dart';

abstract class MealApi {
  Future<CategoryDto> getCategories();
  Future<MealDto> getMeals(String category);
  Future<MealDetailsDto> getMealDetailsById(String id);
}
