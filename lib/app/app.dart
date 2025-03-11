import 'package:flutter/material.dart';
import 'package:uni_life_exam/app/utilities/dependencies.dart';

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  @override
  void initState() {
    // initialize dependencies
    Dependencies().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
