import 'package:flutter/material.dart';
import 'package:meal_app/app/stories/category_stories.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryBookApp extends StatelessWidget {
  const StoryBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(stories: [...CategoryStories().stories]);
  }
}
