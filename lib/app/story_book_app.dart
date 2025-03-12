import 'package:flutter/material.dart';
import 'package:meal_app/app/stories/category_stories.dart';
import 'package:meal_app/app/utilities/dependencies.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryBookApp extends StatefulWidget {
  const StoryBookApp({super.key});

  @override
  State<StoryBookApp> createState() => _StoryBookAppState();
}

class _StoryBookAppState extends State<StoryBookApp> {
  @override
  void initState() {
    Dependencies().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: CategoryStories().stories.first.name,
      stories: [...CategoryStories().stories],
    );
  }
}
