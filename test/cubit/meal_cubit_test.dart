import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/app/error/meal_exceptions.dart';
import 'package:meal_app/features/meals/domain/use_cases/fetch_meals_use_case.dart';
import 'package:meal_app/features/meals/domain/use_cases/search_meals_use_case.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_cubit.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_state.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'meal_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MealItemModel>()])
@GenerateMocks([FetchMealsUseCase, SearchMealsUseCase])
void main() {
  late SearchMealsUseCase searchCategoriesUseCase = MockSearchMealsUseCase();
  late FetchMealsUseCase fetchCategoriesUseCase = MockFetchMealsUseCase();

  late List<MealItemModel> categories;

  setUpAll(() {
    GetIt.instance.registerLazySingleton(() => searchCategoriesUseCase);
    GetIt.instance.registerLazySingleton(() => fetchCategoriesUseCase);
  });
  setUp(() {
    categories = List.generate(20, (index) => MockMealItemModel());
  });
  final String category = 'Seafood';
  blocTest(
    'fetch Categories = loaded',
    build: () => MealCubit(),
    act: (bloc) => bloc.fetchMeals(category, refresh: true),
    setUp: () {
      when(
        fetchCategoriesUseCase.execute(category, true),
      ).thenAnswer((_) => Future.value(categories));
    },
    expect: () => [MealState.loading(), MealState.loaded(categories)],
  );

  blocTest(
    'fetch Categories = error',
    build: () => MealCubit(),
    act: (bloc) => bloc.fetchMeals(category, refresh: true),
    setUp: () {
      when(
        fetchCategoriesUseCase.execute(category, true),
      ).thenThrow(anyOf(isA<MealException>()));
    },
    expect: () => [MealState.loading(), MealState.error()],
  );

  blocTest(
    'search Categories = search results',
    build: () => MealCubit(),
    act: (bloc) => bloc.search(category, 'keyword'),
    setUp: () {
      when(
        searchCategoriesUseCase.execute(category, keyword: 'keyword'),
      ).thenAnswer((_) => Future.value(categories));
    },
    expect: () => [MealState.initial(), MealState.loaded(categories)],
  );

  blocTest(
    'search Categories = no results',
    build: () => MealCubit(),
    act: (bloc) => bloc.search(category, 'keywords'),
    setUp: () {
      when(
        searchCategoriesUseCase.execute(category, keyword: 'keywords'),
      ).thenAnswer((_) => Future.value([]));
    },
    expect: () => [MealState.initial(), MealState.emptyResults()],
  );
}
