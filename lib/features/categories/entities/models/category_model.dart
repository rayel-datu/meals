import 'package:meal_app/app/entities/base_model.dart';
import 'package:meal_app/features/categories/entities/dto/category_dto.dart';

class CategoryModel implements SearchableModel {
  final String category;
  final String thumbnail;
  final String description;

  CategoryModel(this.category, this.thumbnail, this.description);
  factory CategoryModel.fromDto(CategoryItemDto dto) => CategoryModel(
    dto.strCategory,
    dto.strCategoryThumb,
    dto.strCategoryDescription.trim(),
  );

  @override
  String searchProp() => category;
}
