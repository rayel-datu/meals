import 'package:meal_app/features/categories/presentation/atoms/category_list_item.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CategoryStories {
  List<Story> stories = [
    Story(
      name: 'Category/Atoms/Category List Item',
      builder: (context) => CategoryListItem(),
    ),
  ];
}
