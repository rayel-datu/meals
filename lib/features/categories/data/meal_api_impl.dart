import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:uni_life_exam/features/categories/data/meal_api.dart';
import 'package:uni_life_exam/features/categories/entities/dto/category_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_details_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_item_dto.dart';

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
  Future<List<CategoryDto>> getCategories();

  /// Query parameters [i] for id
  @override
  @GET('/1/lookup.php')
  Future<List<MealDetailsDto>> getMealDetailsById(@Query('i') String id);

  /// Query parameters [c] for category e.g. Seafood
  @override
  @GET('/1/filter.php')
  Future<List<MealItemDto>> getMeals(@Query('c') String category);
}
