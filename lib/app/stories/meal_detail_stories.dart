import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/features/meal_details/presentation/atoms/meal_details_step.dart';
import 'package:meal_app/features/meal_details/presentation/meal_details_screen.dart';
import 'package:meal_app/features/meal_details/presentation/molecules/meal_details_app_bar.dart';
import 'package:meal_app/features/meal_details/presentation/molecules/meal_details_info.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MealDetailStories {
  List<Story> stories = [
    Story(
      name: 'Meal Details/Meal Header',
      builder:
          (context) => SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MealDetailsDelegate(
                    extendedHeight: 200,
                    imageUrl: context.knobs.text(
                      label: 'Image Url',
                      initial: 'https://picsum.photos/1000',
                    ),
                    name: context.knobs.text(label: 'Name', initial: 'Meal'),
                    tags: context.knobs
                        .text(
                          label: 'Comma separated tags No Spaces',
                          initial: 'Tag1,Tag2,Tag3',
                        )
                        .split(','),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => ListTile(title: Text("Index: $index")),
                  ),
                ),
              ],
            ),
          ),
    ),

    Story(
      name: 'Meal Details/Meal Info',
      builder:
          (context) => MealDetailsInfo(
            category: context.knobs.text(
              label: 'Category',
              initial: 'Category',
            ),
            country: context.knobs.text(label: 'Country', initial: 'Country'),
          ),
    ),

    Story(
      name: 'Meal Details/Meal Steps',
      builder:
          (context) => MealDetailsStep(
            step: context.knobs.text(label: 'Step', initial: 'Step'),
            stepNo: 1,
          ),
    ),

    Story(
      name: 'Meal Details/Meal Screen',
      builder: (context) => MealDetailsScreen(mealId: '52772'),
    ),
  ];
}
