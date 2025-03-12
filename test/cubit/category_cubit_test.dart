import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/app/error/meal_exceptions.dart';
import 'package:meal_app/features/categories/domain/use_cases/fetch_categories_use_case.dart';
import 'package:meal_app/features/categories/domain/use_cases/search_categories_use_case.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_state.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'category_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryModel>()])
@GenerateMocks([FetchCategoriesUseCase, SearchCategoriesUseCase])
void main() {
  late SearchCategoriesUseCase searchCategoriesUseCase =
      MockSearchCategoriesUseCase();
  late FetchCategoriesUseCase fetchCategoriesUseCase =
      MockFetchCategoriesUseCase();

  late List<CategoryModel> categories;

  setUpAll(() {
    GetIt.instance.registerLazySingleton(() => searchCategoriesUseCase);
    GetIt.instance.registerLazySingleton(() => fetchCategoriesUseCase);
  });
  setUp(() {
    categories = List.generate(20, (index) => MockCategoryModel());
  });

  blocTest(
    'fetch Categories = loaded',
    build: () => CategoryCubit(),
    act: (bloc) => bloc.fetchCategories(refresh: true),
    setUp: () {
      when(
        fetchCategoriesUseCase.execute(true),
      ).thenAnswer((_) => Future.value(categories));
    },
    expect: () => [CategoryState.loading(), CategoryState.loaded(categories)],
  );

  blocTest(
    'fetch Categories = error',
    build: () => CategoryCubit(),
    act: (bloc) => bloc.fetchCategories(refresh: true),
    setUp: () {
      when(
        fetchCategoriesUseCase.execute(true),
      ).thenThrow(anyOf(isA<MealException>()));
    },
    expect: () => [CategoryState.loading(), CategoryState.error()],
  );

  blocTest(
    'search Categories = search results',
    build: () => CategoryCubit(),
    act: (bloc) => bloc.search('keyword'),
    setUp: () {
      when(
        searchCategoriesUseCase.execute('keyword'),
      ).thenAnswer((_) => Future.value(categories));
    },
    expect: () => [CategoryState.loaded(categories)],
  );

  blocTest(
    'search Categories = no results',
    build: () => CategoryCubit(),
    act: (bloc) => bloc.search('keywords'),
    setUp: () {
      when(
        searchCategoriesUseCase.execute('keywords'),
      ).thenAnswer((_) => Future.value([]));
    },
    expect: () => [CategoryState.emptyResults()],
  );
}
