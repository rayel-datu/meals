import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_cubit.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_state.dart';
import 'package:meal_app/features/meals/presentation/molecules/meal_list_item.dart';
import 'package:meal_app/features/meals/presentation/pages/meal_page.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_list.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_loading_indicator.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_text_form_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_helper.dart';
import 'meal_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MealItemModel>(), MockSpec<MealCubit>()])
void main() {
  late MealCubit mealCubit;
  late List<MealItemModel> categories;
  final String category = 'Seafood';

  setUp(() {
    mealCubit = MockMealCubit();
    categories = List.generate(20, (index) => MockMealItemModel());
    categories.forEachIndexed(
      (index, element) => when(element.name).thenReturn('Meal $index'),
    );
  });

  testWidgets('Test loading state', (widgetTester) async {
    when(mealCubit.state).thenReturn(MealState.loading());
    await widgetTester.pumpWidget(
      buildWidget(
        BlocProvider(
          create: (context) => mealCubit,
          child: MealPage(category: category),
        ),
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
    when(mealCubit.state).thenReturn(MealState.loaded(categories));
    await widgetTester.pumpWidget(
      buildWidget(
        BlocProvider(
          create: (context) => mealCubit,
          child: MealPage(category: category),
        ),
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
    when(mealCubit.state).thenReturn(MealState.loaded(categories));
    await widgetTester.pumpWidget(
      buildWidget(
        BlocProvider(
          create: (context) => mealCubit,
          child: MealPage(category: category),
        ),
      ),
    );

    await widgetTester.pumpAndSettle();

    await widgetTester.fling(
      find.byType(MealListItem).first,
      const Offset(0.0, 300.0),
      1000.0,
    );

    // should reload
    verify(mealCubit.fetchMeals(category, refresh: true));
  });
}
