import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/meal_details/presentation/cubit/meal_details_cubit.dart';
import 'package:meal_app/features/meal_details/presentation/page/meal_details_page.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealDetailsCubit(),
      child: MealDetailsPage(mealId: mealId),
    );
  }
}
