import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/features/meal_details/domain/use_cases/fetch_meal_details_use_case.dart';
import 'package:meal_app/features/meal_details/presentation/cubit/meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit({FetchMealDetailUseCase? fetchMealDetailsUseCase})
    : _mealDetailUseCase =
          fetchMealDetailsUseCase ??
          GetIt.instance.get<FetchMealDetailUseCase>(),
      super(MealDetailsState.initial());

  final FetchMealDetailUseCase _mealDetailUseCase;

  Future<void> getMealDetails(String mealId, {bool refresh = true}) async {
    try {
      emit(MealDetailsState.loading());

      final details = await _mealDetailUseCase.execute(mealId, refresh);
      emit(MealDetailsState.loaded(details.first));
    } catch (e) {
      emit(MealDetailsState.error());
    }
  }
}
