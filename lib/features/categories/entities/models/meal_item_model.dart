import 'package:uni_life_exam/features/categories/entities/dto/meal_item_dto.dart';

class MealItemModel {
  final String name;
  final String id;
  final String thumbnail;

  MealItemModel(this.name, this.id, this.thumbnail);
  factory MealItemModel.fromDto(MealItemDto dto) =>
      MealItemModel(dto.strMeal, dto.idMeal, dto.strMealThumb);
}
