import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:meal_app/features/categories/domain/repositories/category_repository.dart';
import 'package:meal_app/features/categories/domain/use_cases/fetch_categories_use_case.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';

import 'fetch_categories_use_case_test.mocks.dart';

@GenerateMocks([CategoryRepository, MealApi])
@GenerateNiceMocks([MockSpec<CategoryModel>()])
void main() {
  late FetchCategoriesUseCase fetchCategoriesUseCase;
  late CategoryRepository categoryRepository;
  late MealApi mealApi;

  setUp(() {
    categoryRepository = MockCategoryRepository();
    fetchCategoriesUseCase = FetchCategoriesUseCase(
      categoryRepository: categoryRepository,
    );
    mealApi = MockMealApi();
    when(categoryRepository.mealApi).thenReturn(mealApi);
  });

  test('Fetch Categories', () async {
    when(categoryRepository.getCategories()).thenAnswer(
      (realInvocation) =>
          Future.value(List.generate(10, (index) => MockCategoryModel())),
    );

    final result = await fetchCategoriesUseCase.execute();
    expect(result, isNotEmpty);
  });
}
