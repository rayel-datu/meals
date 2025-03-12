import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/features/categories/presentation/category_screen.dart';

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
              builder: (context, state) => SizedBox.shrink(),
              routes: [
                GoRoute(
                  path: ':mealId/details',
                  name: 'mealDetails',
                  builder: (context, state) => SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
