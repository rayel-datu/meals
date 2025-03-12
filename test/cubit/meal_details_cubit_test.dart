import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/app/error/meal_exceptions.dart';
import 'package:meal_app/features/meal_details/domain/use_cases/fetch_meal_details_use_case.dart';
import 'package:meal_app/features/meal_details/entities/models/meal_details_model.dart';
import 'package:meal_app/features/meal_details/presentation/cubit/meal_details_cubit.dart';
import 'package:meal_app/features/meal_details/presentation/cubit/meal_details_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'meal_details_cubit_test.mocks.dart';

@GenerateMocks([FetchMealDetailUseCase])
@GenerateNiceMocks([MockSpec<MealDetailsModel>()])
void main() {
  late FetchMealDetailUseCase fetchMealDetailUseCase =
      MockFetchMealDetailUseCase();
  late List<MealDetailsModel> mealDetails;

  setUpAll(
    () => GetIt.instance.registerLazySingleton(() => fetchMealDetailUseCase),
  );

  setUp(() {
    mealDetails = [MockMealDetailsModel()];
  });

  final String mealId = '1234';

  blocTest(
    'Test Fetch',
    build: () => MealDetailsCubit(),
    setUp:
        () => when(
          fetchMealDetailUseCase.execute(mealId, true),
        ).thenAnswer((_) => Future.value(mealDetails)),
    act: (bloc) => bloc.getMealDetails(mealId, refresh: true),
    expect:
        () => [
          MealDetailsState.loading(),
          MealDetailsState.loaded(mealDetails.first),
        ],
  );

  blocTest(
    'Test Fetch Errors',
    build: () => MealDetailsCubit(),
    setUp:
        () => when(
          fetchMealDetailUseCase.execute(mealId, true),
        ).thenThrow(anyOf(isA<MealException>())),
    act: (bloc) => bloc.getMealDetails(mealId, refresh: true),
    expect: () => [MealDetailsState.loading(), MealDetailsState.error()],
  );
}
