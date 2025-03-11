// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItemDto _$CategoryItemDtoFromJson(Map<String, dynamic> json) =>
    CategoryItemDto(
      idCategory: json['idCategory'] as String,
      strCategory: json['strCategory'] as String,
      strCategoryThumb: json['strCategoryThumb'] as String,
      strCategoryDescription: json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$CategoryItemDtoToJson(CategoryItemDto instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  (json['categories'] as List<dynamic>)
      .map((e) => CategoryItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{'categories': instance.categories};
