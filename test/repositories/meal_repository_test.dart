import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni_life_exam/app/data/meal_api.dart';
import 'package:uni_life_exam/app/error/meal_exceptions.dart';
import 'package:uni_life_exam/features/meals/domain/repositories/meal_repository.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_details_dto.dart';
import 'package:uni_life_exam/features/meals/entities/dto/meal_item_dto.dart';
import 'package:uni_life_exam/features/meals/entities/models/meal_details_model.dart';
import 'package:uni_life_exam/features/meals/entities/models/meal_item_model.dart';

import 'meal_repository_test.mocks.dart';

@GenerateMocks([MealApi])
@GenerateNiceMocks([
  MockSpec<MealItemDto>(),
  MockSpec<MealDto>(),
  MockSpec<MealDetailsItemDto>(),
  MockSpec<MealDetailsDto>(),
])
void main() {
  late MealApi mealApi;
  late List<MealItemDto> mealItems;
  late MealDto mealDto;
  late List<MealDetailsItemDto> mealDetailItems;
  late MealDetailsDto mealDetailsDto;
  late MealRepository mealRepository;

  final errorsExceptions = [
    isA<MealException>(),
    isA<DioException>(),
    isA<Exception>(),
    isA<Error>(),
  ];

  setUp(() {
    mealApi = MockMealApi();
    mealItems = List.generate(20, (index) => MockMealItemDto());
    mealDetailItems = List.generate(20, (index) => MockMealDetailsItemDto());
    mealDetailsDto = MockMealDetailsDto();
    mealDto = MockMealDto();
    when(mealDetailsDto.meals).thenReturn(mealDetailItems);
    when(mealDto.meals).thenReturn(mealItems);

    mealRepository = MealRepository(mealApi: mealApi);
  });

  group('Get Meals', () {
    final category = 'Seafood';
    test('get meals by category', () async {
      when(mealApi.getMeals(category)).thenAnswer((_) => Future.value(mealDto));
      final result = await mealRepository.getMealsByCategory(category);

      expect(result, isNotEmpty);
    });

    test('get meals by category from cache', () async {
      when(mealApi.getMeals(category)).thenAnswer((_) => Future.value(mealDto));

      mealRepository.mealsCache = {
        category: [MealItemModel.fromDto(MockMealItemDto())],
      };

      final result = await mealRepository.getMealsByCategory(category);

      verifyNever(mealApi.getMeals(category));
      expect(result, isNotEmpty);
    });

    test(
      'get meals by category from api with cached [force refresh]',
      () async {
        when(
          mealApi.getMeals(category),
        ).thenAnswer((_) => Future.value(mealDto));

        mealRepository.mealsCache = {
          category: [MealItemModel.fromDto(MockMealItemDto())],
        };

        final result = await mealRepository.getMealsByCategory(
          category,
          refresh: true,
        );

        verify(mealApi.getMeals(category));
        expect(result, isNotEmpty);
      },
    );

    test(
      'get meals by category response empty should throw exception',
      () async {
        when(mealDto.meals).thenReturn([]);
        when(
          mealApi.getMeals(category),
        ).thenAnswer((_) => Future.value(mealDto));

        expect(
          mealRepository.getMealsByCategory(category),
          throwsA(isA<EmptyResponseException>()),
        );
      },
    );

    test(
      'get meals by category response throws an error or exception should throw exception',
      () async {
        when(mealApi.getMeals(category)).thenThrow(anyOf(errorsExceptions));

        expect(
          mealRepository.getMealsByCategory(category),
          throwsA(isA<UnknownMealException>()),
        );
      },
    );
  });

  group('Get Meal Details', () {
    final id = '1234';
    test('get meal details by id', () async {
      when(
        mealApi.getMealDetailsById(id),
      ).thenAnswer((_) => Future.value(mealDetailsDto));
      final result = await mealRepository.getMealDetailsById(id);

      expect(result, isNotEmpty);
    });

    test('get meal details by id from cache', () async {
      when(
        mealApi.getMealDetailsById(id),
      ).thenAnswer((_) => Future.value(mealDetailsDto));

      mealRepository.mealDetailsCache = {
        id: [MealDetailsModel.fromDto(MealDetailsItemDto())],
      };

      final result = await mealRepository.getMealDetailsById(id);

      verifyNever(mealApi.getMeals(id));
      expect(result, isNotEmpty);
    });

    test(
      'get meal details by id from api with cached [force refresh]',
      () async {
        when(
          mealApi.getMealDetailsById(id),
        ).thenAnswer((_) => Future.value(mealDetailsDto));

        mealRepository.mealDetailsCache = {
          id: [MealDetailsModel.fromDto(MealDetailsItemDto())],
        };

        final result = await mealRepository.getMealDetailsById(
          id,
          refresh: true,
        );

        verify(mealApi.getMealDetailsById(id));
        expect(result, isNotEmpty);
      },
    );

    test(
      'get meal details by id response empty should throw exception',
      () async {
        when(mealDetailsDto.meals).thenReturn([]);
        when(
          mealApi.getMealDetailsById(id),
        ).thenAnswer((_) => Future.value(mealDetailsDto));

        expect(
          mealRepository.getMealDetailsById(id),
          throwsA(isA<EmptyResponseException>()),
        );
      },
    );

    test(
      'get meal details by id response throws an error or exception should throw exception',
      () async {
        when(mealApi.getMealDetailsById(id)).thenThrow(anyOf(errorsExceptions));

        expect(
          mealRepository.getMealDetailsById(id),
          throwsA(isA<UnknownMealException>()),
        );
      },
    );
  });
}
