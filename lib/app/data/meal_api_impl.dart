import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:meal_app/features/categories/entities/dto/category_dto.dart';
import 'package:meal_app/features/meal_details/entities/dtos/meal_details_dto.dart';
import 'package:meal_app/features/meals/entities/dto/meal_item_dto.dart';

part 'meal_api_impl.g.dart';

@RestApi()
abstract class MealApiImpl implements MealApi {
  factory MealApiImpl(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _MealApiImpl;
  @override
  @GET('/1/categories.php')
  Future<CategoryDto> getCategories();

  /// Query parameters [i] for id
  @override
  @GET('/1/lookup.php')
  Future<MealDetailsDto> getMealDetailsById(@Query('i') String id);

  /// Query parameters [c] for category e.g. Seafood
  @override
  @GET('/1/filter.php')
  Future<MealDto> getMeals(@Query('c') String category);
}
