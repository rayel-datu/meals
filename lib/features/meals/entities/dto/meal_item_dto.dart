import 'package:json_annotation/json_annotation.dart';

part 'meal_item_dto.g.dart';

@JsonSerializable()
class MealItemDto {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;
  
  MealItemDto({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory MealItemDto.fromJson(Map<String, dynamic> json) =>
      _$MealItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealItemDtoToJson(this);
}
