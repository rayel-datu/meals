import 'package:get_it/get_it.dart';
import 'package:uni_life_exam/features/categories/domain/repositories/category_repository.dart';
import 'package:uni_life_exam/features/categories/entities/models/category_model.dart';

class SearchCategoriesUseCase {
  SearchCategoriesUseCase({CategoryRepository? categoryRepository})
    : categoryRepository =
          categoryRepository ?? GetIt.instance.get<CategoryRepository>();

  final CategoryRepository categoryRepository;

  Future<List<CategoryModel>> execute([String searchText = '']) async {
    final source = await categoryRepository.getCategories(refresh: false);
    final sanitizedSearchText = searchText.toLowerCase().trim();
    return source
        .where(
          (element) =>
              searchText.length <=
                      2 // use starts with to search when search text is less than or equal to 2 characters
                  ? element.category.toLowerCase().startsWith(
                    sanitizedSearchText,
                  )
                  // use starts with to search when search text is 3 characters and up
                  : element.category.toLowerCase().contains(
                    sanitizedSearchText,
                  ),
        )
        .toList();
  }
}
