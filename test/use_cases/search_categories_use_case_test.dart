import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni_life_exam/app/data/meal_api.dart';
import 'package:uni_life_exam/features/categories/domain/repositories/category_repository.dart';
import 'package:uni_life_exam/features/categories/domain/use_cases/search_categories_use_case.dart';
import 'package:uni_life_exam/features/categories/entities/models/category_model.dart';
import 'package:collection/collection.dart';

import 'fetch_categories_use_case_test.mocks.dart';

@GenerateMocks([CategoryRepository, MealApi])
@GenerateNiceMocks([MockSpec<CategoryModel>()])
void main() {
  late SearchCategoriesUseCase searchUseCase;
  late CategoryRepository categoryRepository;
  late MealApi mealApi;
  late List<CategoryModel> categories;
  setUp(() {
    categoryRepository = MockCategoryRepository();
    searchUseCase = SearchCategoriesUseCase(
      categoryRepository: categoryRepository,
    );
    mealApi = MockMealApi();
    when(categoryRepository.mealApi).thenReturn(mealApi);
    categories = List.generate(10, (index) => MockCategoryModel());
    categories.forEachIndexed(
      (index, element) => when(
        element.category,
      ).thenReturn(index == 2 ? 'Sample $index' : 'Example $index'),
    );
  });

  test('Search Categories 2 characters', () async {
    when(
      categoryRepository.getCategories(refresh: false),
    ).thenAnswer((realInvocation) => Future.value(categories));

    final result = await searchUseCase.execute('sa');
    expect(result, isNotEmpty);
    expect(result, hasLength(1));
  });

  test('Search Categories 1 characters', () async {
    when(
      categoryRepository.getCategories(refresh: false),
    ).thenAnswer((realInvocation) => Future.value(categories));

    final result = await searchUseCase.execute('s');
    expect(result, isNotEmpty);
    expect(result, hasLength(1));
  });

  test('Search Categories 3 and up characters', () async {
    when(
      categoryRepository.getCategories(refresh: false),
    ).thenAnswer((realInvocation) => Future.value(categories));

    final result = await searchUseCase.execute('ample 2');
    expect(result, isNotEmpty);
    expect(result, hasLength(1));
  });
}
