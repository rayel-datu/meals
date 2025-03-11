import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryItemDto {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  CategoryItemDto({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory CategoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemDtoToJson(this);
}

@JsonSerializable()
class CategoryDto {
  final List<CategoryItemDto> categories;

  CategoryDto(this.categories);

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
