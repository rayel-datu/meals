import 'package:flutter/material.dart';

class MealLoadingIndicator extends StatelessWidget {
  const MealLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(dimension: 64, child: CircularProgressIndicator()),
    );
  }
}
