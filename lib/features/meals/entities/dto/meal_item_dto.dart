import 'package:json_annotation/json_annotation.dart';

part 'meal_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MealDto {
  final List<MealItemDto> meals;

  MealDto(this.meals);

  factory MealDto.fromJson(Map<String, dynamic> json) =>
      _$MealDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealDtoToJson(this);
}

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
