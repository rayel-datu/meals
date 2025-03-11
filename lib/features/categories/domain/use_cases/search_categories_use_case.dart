import 'package:get_it/get_it.dart';
import 'package:meal_app/app/utilities/search_mixin.dart';
import 'package:meal_app/features/categories/domain/repositories/category_repository.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';

class SearchCategoriesUseCase with SearchMixin<CategoryModel> {
  SearchCategoriesUseCase({CategoryRepository? categoryRepository})
    : categoryRepository =
          categoryRepository ?? GetIt.instance.get<CategoryRepository>();

  final CategoryRepository categoryRepository;

  Future<List<CategoryModel>> execute([String keyword = '']) async {
    final source = await categoryRepository.getCategories(refresh: false);

    return search(source, keyword);
  }
}
