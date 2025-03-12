import 'package:flutter/material.dart';

class MealAppbar extends AppBar {
  MealAppbar({super.key, String? titleText})
    : super(
        title: Text(titleText ?? ''),
        centerTitle: true,
        automaticallyImplyLeading: true,
        forceMaterialTransparency: false,
        scrolledUnderElevation: 0,
      );
}
