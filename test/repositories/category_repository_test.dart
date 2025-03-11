import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/app/data/meal_api.dart';
import 'package:meal_app/app/error/meal_exceptions.dart';
import 'package:meal_app/features/categories/domain/repositories/category_repository.dart';
import 'package:meal_app/features/categories/entities/dto/category_dto.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';

import 'category_repository_test.mocks.dart';

@GenerateMocks([MealApi])
@GenerateNiceMocks([MockSpec<CategoryDto>(), MockSpec<CategoryItemDto>()])
void main() {
  late MealApi mealApi;
  late List<CategoryItemDto> categoryItems;
  late CategoryDto categoryDto;
  late CategoryRepository categoryRepository;

  setUp(() {
    mealApi = MockMealApi();
    categoryRepository = CategoryRepository(mealApi: mealApi);

    categoryDto = MockCategoryDto();
    categoryItems = List.generate(20, (index) => MockCategoryItemDto());
    when(categoryDto.categories).thenReturn(categoryItems);
  });

  test('get categories', () async {
    when(mealApi.getCategories()).thenAnswer((_) => Future.value(categoryDto));

    final result = await categoryRepository.getCategories();
    expect(result, isNotEmpty);
  });

  test('get categories, refresh false, categories not empty or null', () async {
    when(mealApi.getCategories()).thenAnswer((_) => Future.value(categoryDto));
    // manually add a category
    categoryRepository.categories = [
      CategoryModel.fromDto(MockCategoryItemDto()),
    ];

    final result = await categoryRepository.getCategories(refresh: false);

    // should not call from api
    verifyNever(mealApi.getCategories());
    expect(result, isNotEmpty);
  });

  test(
    'get categories, should throw an exception when the api returns empty',
    () async {
      when(categoryDto.categories).thenReturn([]);
      when(
        mealApi.getCategories(),
      ).thenAnswer((_) => Future.value(categoryDto));

      expect(
        categoryRepository.getCategories(),
        throwsA(isA<EmptyResponseException>()),
      );
    },
  );

  test(
    'get categories, should throw an exception when the api throws an error',
    () async {
      when(categoryDto.categories).thenReturn([]);
      when(mealApi.getCategories()).thenThrow(
        anyOf([
          isA<MealException>(),
          isA<DioException>(),
          isA<Exception>(),
          isA<Error>(),
        ]),
      );

      expect(categoryRepository.getCategories(), throwsA(isA<MealException>()));
    },
  );
}
