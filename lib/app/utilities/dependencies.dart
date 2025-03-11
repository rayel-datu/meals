import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_life_exam/app/utilities/env_vars.dart';
import 'package:uni_life_exam/app/data/meal_api.dart';
import 'package:uni_life_exam/app/data/meal_api_impl.dart';

class Dependencies {
  void init() {
    final baseUrl = EnvVars.getBaseUrl();
    final mealDio = Dio(BaseOptions(baseUrl: baseUrl));
    final mealApi = MealApiImpl(mealDio, baseUrl: baseUrl);

    GetIt.instance.registerLazySingleton<MealApi>(() => mealApi);
  }
}
