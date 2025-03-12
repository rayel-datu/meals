import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/meals/presentation/cubit/meal_cubit.dart';
import 'package:meal_app/features/meals/presentation/pages/meal_page.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealCubit(),
      child: MealPage(category: category),
    );
  }
}
