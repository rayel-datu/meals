// Mocks generated by Mockito 5.4.5 from annotations
// in meal_app/test/cubit/meal_details_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:meal_app/features/meal_details/domain/use_cases/fetch_meal_details_use_case.dart'
    as _i3;
import 'package:meal_app/features/meal_details/entities/models/meal_details_model.dart'
    as _i5;
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeMealRepository_0 extends _i1.SmartFake
    implements _i2.MealRepository {
  _FakeMealRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [FetchMealDetailUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchMealDetailUseCase extends _i1.Mock
    implements _i3.FetchMealDetailUseCase {
  MockFetchMealDetailUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MealRepository get mealRepository =>
      (super.noSuchMethod(
            Invocation.getter(#mealRepository),
            returnValue: _FakeMealRepository_0(
              this,
              Invocation.getter(#mealRepository),
            ),
          )
          as _i2.MealRepository);

  @override
  _i4.Future<List<_i5.MealDetailsModel>> execute(
    String? id, [
    bool? refresh = false,
  ]) =>
      (super.noSuchMethod(
            Invocation.method(#execute, [id, refresh]),
            returnValue: _i4.Future<List<_i5.MealDetailsModel>>.value(
              <_i5.MealDetailsModel>[],
            ),
          )
          as _i4.Future<List<_i5.MealDetailsModel>>);
}

/// A class which mocks [MealDetailsModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockMealDetailsModel extends _i1.Mock implements _i5.MealDetailsModel {
  @override
  List<String> get instructions =>
      (super.noSuchMethod(
            Invocation.getter(#instructions),
            returnValue: <String>[],
            returnValueForMissingStub: <String>[],
          )
          as List<String>);

  @override
  List<_i5.MealIngredient> get ingredients =>
      (super.noSuchMethod(
            Invocation.getter(#ingredients),
            returnValue: <_i5.MealIngredient>[],
            returnValueForMissingStub: <_i5.MealIngredient>[],
          )
          as List<_i5.MealIngredient>);

  @override
  List<String> get tags =>
      (super.noSuchMethod(
            Invocation.getter(#tags),
            returnValue: <String>[],
            returnValueForMissingStub: <String>[],
          )
          as List<String>);
}
