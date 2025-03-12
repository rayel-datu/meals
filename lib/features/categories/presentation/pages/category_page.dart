import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_state.dart';
import 'package:meal_app/features/categories/presentation/organisms/category_list.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_loading_indicator.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_appbar.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_empty_widget.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_text_form_field.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final _searchController = TextEditingController();
  late CategoryCubit _cubit;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _cubit = BlocProvider.of<CategoryCubit>(context);
    _cubit.fetchCategories(refresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MealAppbar(titleText: 'Categories'),
      body: RefreshIndicator(
        onRefresh: () async {
          _cubit.fetchCategories(refresh: true);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return Column(
                children: [
                  MealTextFormField(
                    enabled: state.whenOrNull(loading: () => false) ?? true,
                    controller: _searchController,
                    hintText: 'Search',
                    onChanged: (value) {
                      _cubit.search(value);
                    },
                  ),
                  Expanded(
                    child:
                        state.whenOrNull(
                          loaded:
                              (categories) =>
                                  CategoryList(categories: categories),
                          emptyResults:
                              () => MealEmptyWidget(
                                keyword: _searchController.text,
                              ),
                          loading: () => MealLoadingIndicator(),
                        ) ??
                        SizedBox.shrink(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
