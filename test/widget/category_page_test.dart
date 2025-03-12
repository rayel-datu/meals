import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/features/categories/entities/models/category_model.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_state.dart';
import 'package:meal_app/features/categories/presentation/molecules/category_list_item.dart';
import 'package:meal_app/features/categories/presentation/pages/category_page.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_list.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_loading_indicator.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_text_form_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_helper.dart';
import 'category_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryModel>(), MockSpec<CategoryCubit>()])
void main() {
  late CategoryCubit categoryCubit;
  late List<CategoryModel> categories;

  setUp(() {
    categoryCubit = MockCategoryCubit();
    categories = List.generate(20, (index) => MockCategoryModel());
    categories.forEachIndexed(
      (index, element) => when(element.category).thenReturn('Category $index'),
    );
  });

  testWidgets('Test loading state', (widgetTester) async {
    when(categoryCubit.state).thenReturn(CategoryState.loading());
    await widgetTester.pumpWidget(
      buildWidget(
        BlocProvider(create: (context) => categoryCubit, child: CategoryPage()),
      ),
    );

    await widgetTester.pump();

    final searchField =
        find.byType(MealTextFormField).evaluate().first.widget
            as MealTextFormField;

    // search should be disabled while loading
    expect(searchField.enabled, false);

    // should show loading indicator
    expect(find.byType(MealLoadingIndicator), findsOneWidget);
  });

  testWidgets('Test loaded state', (widgetTester) async {
    when(categoryCubit.state).thenReturn(CategoryState.loaded(categories));
    await widgetTester.pumpWidget(
      buildWidget(
        BlocProvider(create: (context) => categoryCubit, child: CategoryPage()),
      ),
    );

    await widgetTester.pumpAndSettle();

    final searchField =
        find.byType(MealTextFormField).evaluate().first.widget
            as MealTextFormField;

    final list = find.byType(MealList).evaluate().first.widget as MealList;

    expect(list.semanticChildCount, categories.length);

    // search should be enabled when loaded
    expect(searchField.enabled, true);
  });

  testWidgets('Test pull to refresh state', (widgetTester) async {
    when(categoryCubit.state).thenReturn(CategoryState.loaded(categories));
    await widgetTester.pumpWidget(
      buildWidget(
        BlocProvider(create: (context) => categoryCubit, child: CategoryPage()),
      ),
    );

    await widgetTester.pumpAndSettle();

    await widgetTester.fling(
      find.byType(CategoryListItem).first,
      const Offset(0.0, 300.0),
      1000.0,
    );

    // should reload
    verify(categoryCubit.fetchCategories(refresh: true));
  });
}
