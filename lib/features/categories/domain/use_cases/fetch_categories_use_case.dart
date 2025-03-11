import 'package:get_it/get_it.dart';
import 'package:uni_life_exam/features/categories/domain/repositories/category_repository.dart';
import 'package:uni_life_exam/features/categories/entities/models/category_model.dart';

class FetchCategoriesUseCase {
  FetchCategoriesUseCase({CategoryRepository? categoryRepository})
    : categoryRepository =
          categoryRepository ?? GetIt.instance.get<CategoryRepository>();

  final CategoryRepository categoryRepository;

  Future<List<CategoryModel>> execute([bool refresh = false]) async =>
      await categoryRepository.getCategories(refresh: refresh);
}
