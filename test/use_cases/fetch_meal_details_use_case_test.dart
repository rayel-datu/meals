import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/domain/use_cases/fetch_meal_details_use_case.dart';
import 'package:meal_app/features/meals/entities/models/meal_details_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'fetch_meal_details_use_case_test.mocks.dart';

@GenerateMocks([MealRepository, MealApi])
@GenerateNiceMocks([MockSpec<MealDetailsModel>()])
void main() {
  late FetchMealDetailUseCase fetchMealDetailUseCase;
  late MealRepository mealRepository;
  late MealApi mealApi;

  setUp(() {
    mealRepository = MockMealRepository();
    fetchMealDetailUseCase = FetchMealDetailUseCase(
      mealRepository: mealRepository,
    );
    mealApi = MockMealApi();
    when(mealRepository.mealApi).thenReturn(mealApi);
  });

  test('Fetch Categories', () async {
    String id = '1234';
    when(mealRepository.getMealDetailsById(id)).thenAnswer(
      (realInvocation) =>
          Future.value(List.generate(10, (index) => MockMealDetailsModel())),
    );

    final result = await fetchMealDetailUseCase.execute(id);
    expect(result, isNotEmpty);
  });
}
