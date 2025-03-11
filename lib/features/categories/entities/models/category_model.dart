import 'package:uni_life_exam/features/categories/entities/dto/category_dto.dart';

class CategoryModel {
  final String category;
  final String thumbnail;
  final String description;

  CategoryModel(this.category, this.thumbnail, this.description);
  factory CategoryModel.fromDto(CategoryDto dto) => CategoryModel(
    dto.strCategory,
    dto.strCategoryThumb,
    dto.strCategoryDescription,
  );
}
