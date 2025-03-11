// Mocks generated by Mockito 5.4.5 from annotations
// in uni_life_exam/test/repositories/category_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:uni_life_exam/app/data/meal_api.dart' as _i5;
import 'package:uni_life_exam/features/categories/entities/dto/category_dto.dart'
    as _i2;
import 'package:uni_life_exam/features/meals/entities/dto/meal_details_dto.dart'
    as _i4;
import 'package:uni_life_exam/features/meals/entities/dto/meal_item_dto.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCategoryDto_0 extends _i1.SmartFake implements _i2.CategoryDto {
  _FakeCategoryDto_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMealDto_1 extends _i1.SmartFake implements _i3.MealDto {
  _FakeMealDto_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMealDetailsDto_2 extends _i1.SmartFake
    implements _i4.MealDetailsDto {
  _FakeMealDetailsDto_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MealApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockMealApi extends _i1.Mock implements _i5.MealApi {
  MockMealApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.CategoryDto> getCategories() =>
      (super.noSuchMethod(
            Invocation.method(#getCategories, []),
            returnValue: _i6.Future<_i2.CategoryDto>.value(
              _FakeCategoryDto_0(this, Invocation.method(#getCategories, [])),
            ),
          )
          as _i6.Future<_i2.CategoryDto>);

  @override
  _i6.Future<_i3.MealDto> getMeals(String? category) =>
      (super.noSuchMethod(
            Invocation.method(#getMeals, [category]),
            returnValue: _i6.Future<_i3.MealDto>.value(
              _FakeMealDto_1(this, Invocation.method(#getMeals, [category])),
            ),
          )
          as _i6.Future<_i3.MealDto>);

  @override
  _i6.Future<_i4.MealDetailsDto> getMealDetailsById(String? id) =>
      (super.noSuchMethod(
            Invocation.method(#getMealDetailsById, [id]),
            returnValue: _i6.Future<_i4.MealDetailsDto>.value(
              _FakeMealDetailsDto_2(
                this,
                Invocation.method(#getMealDetailsById, [id]),
              ),
            ),
          )
          as _i6.Future<_i4.MealDetailsDto>);
}

/// A class which mocks [CategoryDto].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryDto extends _i1.Mock implements _i2.CategoryDto {
  @override
  List<_i2.CategoryItemDto> get categories =>
      (super.noSuchMethod(
            Invocation.getter(#categories),
            returnValue: <_i2.CategoryItemDto>[],
            returnValueForMissingStub: <_i2.CategoryItemDto>[],
          )
          as List<_i2.CategoryItemDto>);

  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(
            Invocation.method(#toJson, []),
            returnValue: <String, dynamic>{},
            returnValueForMissingStub: <String, dynamic>{},
          )
          as Map<String, dynamic>);
}

/// A class which mocks [CategoryItemDto].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryItemDto extends _i1.Mock implements _i2.CategoryItemDto {
  @override
  String get idCategory =>
      (super.noSuchMethod(
            Invocation.getter(#idCategory),
            returnValue: _i7.dummyValue<String>(
              this,
              Invocation.getter(#idCategory),
            ),
            returnValueForMissingStub: _i7.dummyValue<String>(
              this,
              Invocation.getter(#idCategory),
            ),
          )
          as String);

  @override
  String get strCategory =>
      (super.noSuchMethod(
            Invocation.getter(#strCategory),
            returnValue: _i7.dummyValue<String>(
              this,
              Invocation.getter(#strCategory),
            ),
            returnValueForMissingStub: _i7.dummyValue<String>(
              this,
              Invocation.getter(#strCategory),
            ),
          )
          as String);

  @override
  String get strCategoryThumb =>
      (super.noSuchMethod(
            Invocation.getter(#strCategoryThumb),
            returnValue: _i7.dummyValue<String>(
              this,
              Invocation.getter(#strCategoryThumb),
            ),
            returnValueForMissingStub: _i7.dummyValue<String>(
              this,
              Invocation.getter(#strCategoryThumb),
            ),
          )
          as String);

  @override
  String get strCategoryDescription =>
      (super.noSuchMethod(
            Invocation.getter(#strCategoryDescription),
            returnValue: _i7.dummyValue<String>(
              this,
              Invocation.getter(#strCategoryDescription),
            ),
            returnValueForMissingStub: _i7.dummyValue<String>(
              this,
              Invocation.getter(#strCategoryDescription),
            ),
          )
          as String);

  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(
            Invocation.method(#toJson, []),
            returnValue: <String, dynamic>{},
            returnValueForMissingStub: <String, dynamic>{},
          )
          as Map<String, dynamic>);
}
