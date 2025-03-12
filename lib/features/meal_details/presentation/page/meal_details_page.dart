import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/meal_details/presentation/atoms/meal_details_step.dart';
import 'package:meal_app/features/meal_details/presentation/cubit/meal_details_cubit.dart';
import 'package:meal_app/features/meal_details/presentation/cubit/meal_details_state.dart';
import 'package:meal_app/features/meal_details/presentation/molecules/meal_details_app_bar.dart';
import 'package:meal_app/features/meal_details/presentation/molecules/meal_details_info.dart';
import 'package:meal_app/features/meal_details/presentation/molecules/meal_details_ingredients.dart';
import 'package:meal_app/features/meal_details/presentation/molecules/meal_details_steps.dart';
import 'package:meal_app/features/reusable/presentation/atoms/meal_loading_indicator.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({super.key, required this.mealId});

  final String mealId;

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  late final String mealId = widget.mealId;
  @override
  void initState() {
    BlocProvider.of<MealDetailsCubit>(context).getMealDetails(mealId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsCubit, MealDetailsState>(
      builder: (context, state) {
        return state.whenOrNull(
              loading:
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [MealLoadingIndicator()],
                  ),
              loaded: (mealDetail) {
                final widgets = [
                  SizedBox(height: 12),
                  MealDetailsInfo(
                    category: mealDetail.category ?? '',
                    country: mealDetail.originCountry ?? '',
                  ),
                  MealDetailsIngredients(ingredients: mealDetail.ingredients),
                  MealDetailsSteps(instructions: mealDetail.instructions),
                ];
                return SafeArea(
                  child: Material(
                    child: CustomScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: MealDetailsDelegate(
                            extendedHeight: 200,
                            imageUrl: mealDetail.thumbnail ?? '',
                            name: mealDetail.name ?? '',
                            tags: mealDetail.tags,
                          ),
                        ),
                        Expanded(
                          child: SliverList.separated(
                            itemBuilder: (context, index) => widgets[index],
                            itemCount: widgets.length,
                            separatorBuilder:
                                (context, index) => SizedBox(height: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ) ??
            SizedBox.shrink();
      },
    );
  }
}
