import 'package:meal_app/features/categories/entities/models/category_model.dart';
import 'package:meal_app/features/categories/presentation/category_screen.dart';
import 'package:meal_app/features/categories/presentation/molecules/category_list_item.dart';
import 'package:meal_app/features/categories/presentation/organisms/category_list.dart';
import 'package:meal_app/features/categories/presentation/pages/category_page.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CategoryStories {
  List<Story> stories = [
    Story(
      name: 'Category/Category List Item',
      builder:
          (context) => CategoryListItem(
            categoryModel: CategoryModel(
              context.knobs.text(label: 'Category Name', initial: 'Title'),
              context.knobs.text(
                label: 'Image Url',
                initial: 'https://picsum.photos/300',
              ),
              context.knobs.text(
                label: 'Description',
                initial: 'This is a long description',
              ),
            ),
          ),
    ),
    Story(
      name: 'Category/Category List',
      builder:
          (context) => CategoryList(
            categories: List.generate(
              40,
              (index) => CategoryModel(
                'Category $index',
                'https://picsum.photos/id/${index + 1}/200/300',
                'This is a long description',
              ),
            ),
          ),
    ),
    Story(
      name: 'Category/Category Screen',
      builder: (context) => CategoryScreen(),
    ),
  ];
}
