import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_cubit.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_state.dart';
import 'package:meal_app/features/meals/presentation/organisms/meal_list.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_loading_indicator.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_appbar.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_empty_widget.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_text_form_field.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key, required this.category});
  final String category;

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  late final _searchController = TextEditingController();
  late MealCubit _cubit;
  late final String category = widget.category;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _cubit = BlocProvider.of<MealCubit>(context);
    _cubit.fetchMeals(category, refresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MealAppbar(titleText: 'Meals'),
      body: RefreshIndicator(
        onRefresh: () async {
          _cubit.fetchMeals(category, refresh: true);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<MealCubit, MealState>(
            builder: (context, state) {
              return Column(
                children: [
                  MealTextFormField(
                    enabled: state.whenOrNull(loading: () => false) ?? true,
                    controller: _searchController,
                    hintText: 'Search',
                    onChanged: (value) {
                      _cubit.search(category, value);
                    },
                  ),
                  Expanded(
                    child:
                        state.whenOrNull(
                          loaded:
                              (meals) => MealItemList(
                                meals: meals,
                                category: category,
                              ),
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
