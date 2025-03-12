import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app/features/categories/domain/use_cases/fetch_categories_use_case.dart';
import 'package:meal_app/features/categories/domain/use_cases/search_categories_use_case.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({
    FetchCategoriesUseCase? fetchCategoriesUseCase,
    SearchCategoriesUseCase? searchCategoriesUseCase,
  }) : _fetchCategoriesUseCase =
           fetchCategoriesUseCase ??
           GetIt.instance.get<FetchCategoriesUseCase>(),
       _searchCategoriesUseCase =
           searchCategoriesUseCase ??
           GetIt.instance.get<SearchCategoriesUseCase>(),
       super(CategoryState.initial());

  final FetchCategoriesUseCase _fetchCategoriesUseCase;
  final SearchCategoriesUseCase _searchCategoriesUseCase;

  Future<void> fetchCategories({bool refresh = true}) async {
    emit(CategoryState.loading());
    try {
      final categories = await _fetchCategoriesUseCase.execute(refresh);

      emit(CategoryState.loaded(categories));
    } catch (e) {
      emit(CategoryState.error());
    }
  }

  Future<void> search(String keyword) async {
    emit(CategoryState.initial());
    final categories = await _searchCategoriesUseCase.execute(keyword);
    if (categories.isEmpty) {
      emit(CategoryState.emptyResults());
      return;
    }
    emit(CategoryState.loaded(categories));
  }
}
