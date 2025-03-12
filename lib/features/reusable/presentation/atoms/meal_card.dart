import 'package:flutter/material.dart';

class MealCard extends Card {
  MealCard({super.key, Widget? child})
    : super(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500),
            child: child,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      );
}
