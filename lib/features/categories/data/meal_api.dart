import 'package:uni_life_exam/features/categories/entities/dto/category_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_details_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_item_dto.dart';

abstract class MealApi {
  Future<List<CategoryDto>> getCategories();
  Future<List<MealItemDto>> getMeals(String category);
  Future<List<MealDetailsDto>> getMealDetailsById(String id);
}
