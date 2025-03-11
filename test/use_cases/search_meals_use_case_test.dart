import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/domain/use_cases/search_meals_use_case.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:collection/collection.dart';

import 'search_meals_use_case_test.mocks.dart';

@GenerateMocks([MealRepository, MealApi])
@GenerateNiceMocks([MockSpec<MealItemModel>()])
void main() {
  late SearchMealsUseCase searchUseCase;
  late MealRepository mealRepository;
  late MealApi mealApi;
  late List<MealItemModel> categories;
  setUp(() {
    mealRepository = MockMealRepository();
    searchUseCase = SearchMealsUseCase(mealRepository: mealRepository);
    mealApi = MockMealApi();
    when(mealRepository.mealApi).thenReturn(mealApi);
    categories = List.generate(10, (index) => MockMealItemModel());
    categories.forEachIndexed(
      (index, element) => when(
        element.searchProp(),
      ).thenReturn(index == 2 ? 'Sample $index' : 'Example $index'),
    );
  });

  final String category = 'Seafood';

  test('Search Categories 2 characters', () async {
    when(
      mealRepository.getMealsByCategory(category, refresh: false),
    ).thenAnswer((realInvocation) => Future.value(categories));

    final result = await searchUseCase.execute(category, keyword: 'sa');
    expect(result, isNotEmpty);
    expect(result, hasLength(1));
  });

  test('Search Categories 1 characters', () async {
    when(
      mealRepository.getMealsByCategory(category, refresh: false),
    ).thenAnswer((realInvocation) => Future.value(categories));

    final result = await searchUseCase.execute(category, keyword: 's');
    expect(result, isNotEmpty);
    expect(result, hasLength(1));
  });

  test('Search Categories 3 and up characters', () async {
    when(
      mealRepository.getMealsByCategory(category, refresh: false),
    ).thenAnswer((realInvocation) => Future.value(categories));

    final result = await searchUseCase.execute(category, keyword: 'ample 2');
    expect(result, isNotEmpty);
    expect(result, hasLength(1));
  });
}
