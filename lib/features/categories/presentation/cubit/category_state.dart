import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState.initial() = CategoryInitialState;
  factory CategoryState.loading() = CategoryLoadingState;
  factory CategoryState.loaded(List<CategoryModel> categories) =
      CategoryLoadedState;
  factory CategoryState.emptyResults() = CategoryEmptyResultsState;
  factory CategoryState.error() = CategoryErrorState;
}
