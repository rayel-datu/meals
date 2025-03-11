import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:meal_app/app/data/meal_api_impl.dart';
import 'package:meal_app/features/categories/entities/dto/category_dto.dart';
import 'package:meal_app/features/meals/entities/dto/meal_details_dto.dart';
import 'package:meal_app/features/meals/entities/dto/meal_item_dto.dart';

import 'meal_api_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Response>(),
  MockSpec<RequestOptions>(),
  MockSpec<Dio>(),
  MockSpec<BaseOptions>(),
  MockSpec<CategoryDto>(),
])
void main() {
  late MealApi api;
  late MockDio dio;
  late RequestOptions requestOptions;
  late BaseOptions baseOptions;
  late Response<Map<String, dynamic>> response;

  final String baseUrl = 'https://google.com';

  final categoryJson = {
    "categories": [
      {
        "idCategory": "1",
        "strCategory": "Beef",
        "strCategoryThumb":
            "https://www.themealdb.com/images/category/beef.png",
        "strCategoryDescription":
            "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
      },
    ],
  };

  final mealDetailsjson = {
    "meals": [
      {
        "idMeal": "52772",
        "strMeal": "Teriyaki Chicken Casserole",
        "strMealAlternate": null,
        "strCategory": "Chicken",
        "strArea": "Japanese",
        "strInstructions":
            "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!",
        "strMealThumb":
            "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        "strTags": "Meat,Casserole",
        "strYoutube": "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        "strIngredient1": "soy sauce",
        "strIngredient2": "water",
        "strIngredient3": "brown sugar",
        "strIngredient4": "ground ginger",
        "strIngredient5": "minced garlic",
        "strIngredient6": "cornstarch",
        "strIngredient7": "chicken breasts",
        "strIngredient8": "stir-fry vegetables",
        "strIngredient9": "brown rice",
        "strIngredient10": "",
        "strIngredient11": "",
        "strIngredient12": "",
        "strIngredient13": "",
        "strIngredient14": "",
        "strIngredient15": "",
        "strIngredient16": null,
        "strIngredient17": null,
        "strIngredient18": null,
        "strIngredient19": null,
        "strIngredient20": null,
        "strMeasure1": "3/4 cup",
        "strMeasure2": "1/2 cup",
        "strMeasure3": "1/4 cup",
        "strMeasure4": "1/2 teaspoon",
        "strMeasure5": "1/2 teaspoon",
        "strMeasure6": "4 Tablespoons",
        "strMeasure7": "2",
        "strMeasure8": "1 (12 oz.)",
        "strMeasure9": "3 cups",
        "strMeasure10": "",
        "strMeasure11": "",
        "strMeasure12": "",
        "strMeasure13": "",
        "strMeasure14": "",
        "strMeasure15": "",
        "strMeasure16": null,
        "strMeasure17": null,
        "strMeasure18": null,
        "strMeasure19": null,
        "strMeasure20": null,
        "strSource": null,
        "strImageSource": null,
        "strCreativeCommonsConfirmed": null,
        "dateModified": null,
      },
    ],
  };

  final mealsJson = {
    "meals": [
      {
        "strMeal": "Baked salmon with fennel & tomatoes",
        "strMealThumb":
            "https://www.themealdb.com/images/media/meals/1548772327.jpg",
        "idMeal": "52959",
      },
    ],
  };

  setUp(() {
    dio = MockDio();
    api = MealApiImpl(dio);
    response = MockResponse();
    requestOptions = MockRequestOptions();
    baseOptions = MockBaseOptions();

    when(dio.options).thenReturn(baseOptions);
    when(baseOptions.baseUrl).thenReturn(baseUrl);
    when(requestOptions.baseUrl).thenReturn(baseUrl);
    when(requestOptions.method).thenReturn('GET');
  });

  test('Get Categories', () async {
    when(requestOptions.path).thenReturn('/1/categories.php');
    when(response.data).thenReturn(categoryJson);
    when(
      dio.fetch<Map<String, dynamic>>(any),
    ).thenAnswer((realInvocation) => Future.value(response));

    final result = await api.getCategories();

    expect(result, isA<CategoryDto>());
  });

  test('Get Categories with errors', () async {
    when(requestOptions.path).thenReturn('/1/categories.php');
    when(response.data).thenReturn(categoryJson);
    when(
      dio.fetch<Map<String, dynamic>>(any),
    ).thenThrow(anyOf([isA<DioException>()]));

    expect(api.getCategories(), throwsA(isA<Object>()));
  });

  test('Get Meal details by Id', () async {
    final String id = '1';
    when(requestOptions.path).thenReturn('/1/lookup.php');
    when(
      requestOptions.queryParameters,
    ).thenReturn(<String, dynamic>{r'i': id});
    when(response.data).thenReturn(mealDetailsjson);
    when(
      dio.fetch<Map<String, dynamic>>(any),
    ).thenAnswer((realInvocation) => Future.value(response));

    final result = await api.getMealDetailsById(id);

    expect(result, isA<MealDetailsDto>());
  });

  test('Get Meal details by Id with errors', () async {
    final String id = '1';
    when(requestOptions.path).thenReturn('/1/lookup.php');
    when(
      requestOptions.queryParameters,
    ).thenReturn(<String, dynamic>{r'i': id});
    when(response.data).thenReturn(mealDetailsjson);
    when(
      dio.fetch<Map<String, dynamic>>(any),
    ).thenThrow(anyOf([isA<DioException>()]));

    expect(api.getMealDetailsById(id), throwsA(isA<Object>()));
  });

  test('Get Meals by category', () async {
    final String category = 'Seafood';
    when(requestOptions.path).thenReturn('/1/lookup.php');
    when(
      requestOptions.queryParameters,
    ).thenReturn(<String, dynamic>{r'i': category});
    when(response.data).thenReturn(mealsJson);
    when(
      dio.fetch<Map<String, dynamic>>(any),
    ).thenAnswer((realInvocation) => Future.value(response));

    final result = await api.getMeals(category);

    expect(result, isA<MealDto>());
  });

  test('Get Meals with errors', () async {
    final String category = 'Seafood';
    when(requestOptions.path).thenReturn('/1/filter.php');
    when(
      requestOptions.queryParameters,
    ).thenReturn(<String, dynamic>{r'c': category});
    when(response.data).thenReturn(mealsJson);
    when(
      dio.fetch<Map<String, dynamic>>(any),
    ).thenThrow(anyOf([isA<DioException>()]));

    expect(api.getMeals(category), throwsA(isA<Object>()));
  });
}
