import 'package:meal_app/app/entities/base_model.dart';
import 'package:meal_app/features/meals/entities/dto/meal_item_dto.dart';

class MealItemModel implements SearchableModel {
  final String name;
  final String id;
  final String thumbnail;

  MealItemModel(this.name, this.id, this.thumbnail);
  factory MealItemModel.fromDto(MealItemDto dto) =>
      MealItemModel(dto.strMeal, dto.idMeal, dto.strMealThumb);

  @override
  String searchProp() => name;
}
