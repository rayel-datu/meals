import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/features/meals/domain/use_cases/fetch_meals_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';

import 'fetch_meals_use_case_test.mocks.dart';

@GenerateMocks([MealRepository, MealApi])
@GenerateNiceMocks([MockSpec<MealItemModel>()])
void main() {
  late FetchMealsUseCase fetchMealsUseCase;
  late MealRepository mealRepository;
  late MealApi mealApi;

  setUp(() {
    mealRepository = MockMealRepository();
    fetchMealsUseCase = FetchMealsUseCase(mealRepository: mealRepository);
    mealApi = MockMealApi();
    when(mealRepository.mealApi).thenReturn(mealApi);
  });

  test('Fetch Categories', () async {
    String category = 'Seafood';
    when(mealRepository.getMealsByCategory(category)).thenAnswer(
      (realInvocation) =>
          Future.value(List.generate(10, (index) => MockMealItemModel())),
    );

    final result = await fetchMealsUseCase.execute(category);
    expect(result, isNotEmpty);
  });
}
