import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_life_exam/app/utilities/env_vars.dart';
import 'package:uni_life_exam/app/data/meal_api.dart';
import 'package:uni_life_exam/app/data/meal_api_impl.dart';
import 'package:uni_life_exam/features/categories/domain/repositories/category_repository.dart';
import 'package:uni_life_exam/features/categories/domain/use_cases/fetch_categories_use_case.dart';
import 'package:uni_life_exam/features/categories/domain/use_cases/search_categories_use_case.dart';
import 'package:uni_life_exam/features/meals/domain/repositories/meal_repository.dart';

class Dependencies {
  void init() {
    final baseUrl = EnvVars.getBaseUrl();
    final mealDio = Dio(BaseOptions(baseUrl: baseUrl));
    final mealApi = MealApiImpl(mealDio, baseUrl: baseUrl);

    GetIt.instance.registerLazySingleton<MealApi>(() => mealApi);

    _initializeRepositories();
    _initializeUseCases();
  }

  void _initializeRepositories() {
    GetIt.instance.registerLazySingleton<MealRepository>(
      () => MealRepository(),
    );
    GetIt.instance.registerLazySingleton<CategoryRepository>(
      () => CategoryRepository(),
    );
  }

  void _initializeUseCases() {
    GetIt.instance.registerLazySingleton<FetchCategoriesUseCase>(
      () => FetchCategoriesUseCase(),
    );
    GetIt.instance.registerLazySingleton<SearchCategoriesUseCase>(
      () => SearchCategoriesUseCase(),
    );
  }
}
