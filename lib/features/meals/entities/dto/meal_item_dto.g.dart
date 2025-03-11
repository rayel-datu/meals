// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDto _$MealDtoFromJson(Map<String, dynamic> json) => MealDto(
  (json['meals'] as List<dynamic>)
      .map((e) => MealItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealDtoToJson(MealDto instance) => <String, dynamic>{
  'meals': instance.meals.map((e) => e.toJson()).toList(),
};

MealItemDto _$MealItemDtoFromJson(Map<String, dynamic> json) => MealItemDto(
  strMeal: json['strMeal'] as String,
  strMealThumb: json['strMealThumb'] as String,
  idMeal: json['idMeal'] as String,
);

Map<String, dynamic> _$MealItemDtoToJson(MealItemDto instance) =>
    <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
    };
