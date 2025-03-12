import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_app/features/meal_details/entities/models/meal_details_model.dart';

part 'meal_details_state.freezed.dart';

@freezed
class MealDetailsState with _$MealDetailsState{
  factory MealDetailsState.initial() = MealDetailsInitialState;
  factory MealDetailsState.loading() = MealDetailsLoadingState;
  factory MealDetailsState.loaded(MealDetailsModel mealDetail) =
      MealDetailsLoadedState;
  factory MealDetailsState.error() = MealDetailsErrorState;
}
