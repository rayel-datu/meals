import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/features/meals/domain/use_cases/fetch_meals_use_case.dart';
import 'package:meal_app/features/meals/domain/use_cases/search_meals_use_case.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit({
    FetchMealsUseCase? fetchMealsUseCase,
    SearchMealsUseCase? searchMealsUseCase,
  }) : _fetchMealsUseCase =
           fetchMealsUseCase ?? GetIt.instance.get<FetchMealsUseCase>(),
       _searchMealsUseCase =
           searchMealsUseCase ?? GetIt.instance.get<SearchMealsUseCase>(),
       super(MealState.initial());

  final FetchMealsUseCase _fetchMealsUseCase;
  final SearchMealsUseCase _searchMealsUseCase;

  Future<void> fetchMeals(String category, {bool refresh = true}) async {
    emit(MealState.loading());
    try {
      final meals = await _fetchMealsUseCase.execute(category, refresh);

      emit(MealState.loaded(meals));
    } catch (e) {
      emit(MealState.error());
    }
  }

  Future<void> search(String category, String keyword) async {
    emit(MealState.initial());
    final categories = await _searchMealsUseCase.execute(
      category,
      keyword: keyword,
    );
    if (categories.isEmpty) {
      emit(MealState.emptyResults());
      return;
    }
    emit(MealState.loaded(categories));
  }
}
