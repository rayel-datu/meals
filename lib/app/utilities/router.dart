import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/features/categories/presentation/category_screen.dart';
import 'package:meal_app/features/meal_details/presentation/meal_details_screen.dart';
import 'package:meal_app/features/meals/presentation/meal_screen.dart';

class MealRouter {
  static GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  RouterConfig<Object> routerConfig([String? initialLocation]) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation ?? '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'categories',
          builder: (context, state) => CategoryScreen(),
          routes: [
            GoRoute(
              path: 'category/:category/meals',
              name: 'meals',
              builder:
                  (context, state) => MealScreen(
                    category: state.pathParameters['category'] ?? '',
                  ),
              routes: [
                GoRoute(
                  path: ':mealId/details',
                  name: 'mealDetails',
                  builder:
                      (context, state) => MealDetailsScreen(
                        mealId: state.pathParameters['mealId'] ?? '',
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
