import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:meal_app/features/categories/presentation/pages/category_page.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: CategoryPage(),
    );
  }
}
