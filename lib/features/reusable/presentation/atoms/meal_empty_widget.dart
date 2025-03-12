import 'package:flutter/material.dart';

class MealEmptyWidget extends StatelessWidget {
  const MealEmptyWidget({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Cannot find anything with the keyword: $keyword',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
