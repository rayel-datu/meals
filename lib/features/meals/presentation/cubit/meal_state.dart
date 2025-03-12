import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';

part 'meal_state.freezed.dart';

@freezed
class MealState with _$MealState {
  factory MealState.initial() = MealInitialState;
  factory MealState.loading() = MealLoadingState;
  factory MealState.loaded(List<MealItemModel> meals) = MealLoadedState;
  factory MealState.emptyResults() = MealEmptyResultsState;
  factory MealState.error() = MealErrorState;
}
