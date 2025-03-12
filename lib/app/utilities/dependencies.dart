import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/app/utilities/env_vars.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:meal_app/app/data/meal_api_impl.dart';
import 'package:meal_app/features/categories/domain/repositories/category_repository.dart';
import 'package:meal_app/features/categories/domain/use_cases/fetch_categories_use_case.dart';
import 'package:meal_app/features/categories/domain/use_cases/search_categories_use_case.dart';
import 'package:meal_app/features/meal_details/domain/use_cases/fetch_meal_details_use_case.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/domain/use_cases/fetch_meals_use_case.dart';
import 'package:meal_app/features/meals/domain/use_cases/search_meals_use_case.dart';

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
    GetIt.instance.registerLazySingleton<FetchMealsUseCase>(
      () => FetchMealsUseCase(),
    );
    GetIt.instance.registerLazySingleton<SearchMealsUseCase>(
      () => SearchMealsUseCase(),
    );
     GetIt.instance.registerLazySingleton<FetchMealDetailUseCase>(
      () => FetchMealDetailUseCase(),
    );
  }
}
