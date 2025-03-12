import 'package:meal_app/features/meals/entities/models/meal_item_model.dart';
import 'package:meal_app/features/meals/presentation/meal_screen.dart';
import 'package:meal_app/features/meals/presentation/molecules/meal_list_item.dart';
import 'package:meal_app/features/meals/presentation/organisms/meal_list.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MealStories {
  List<Story> stories = [
    Story(
      name: 'Meal/Meal List Item',
      builder:
          (context) => MealListItem(
            mealItemModel: MealItemModel(
              context.knobs.text(label: 'Category Name', initial: 'Title'),
              '',
              context.knobs.text(
                label: 'Thumbnail',
                initial: 'https://picsum.photos/seed/picsum/200/300',
              ),
            ),
            category: 'Seafood',
          ),
    ),
    Story(
      name: 'Meal/Meal List',
      builder:
          (context) => MealItemList(
            meals: List.generate(
              40,
              (index) => MealItemModel(
                'Category $index',
                '',
                'https://picsum.photos/id/${index + 1}/200/300',
              ),
            ),
            category: 'Seafood',
          ),
    ),
    Story(
      name: 'Meal/Meal Screen',
      builder: (context) => MealScreen(category: 'Seafood'),
    ),
  ];
}
