import 'package:flutter/material.dart';
import 'package:meal_app/features/categories/presentation/atoms/category_list_item.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryBookApp extends StatelessWidget {
  const StoryBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: 'Category/Atoms/Category List Item',
          builder: (context) => CategoryListItem(),
        ),
      ],
    );
  }
}
