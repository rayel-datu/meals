import 'package:flutter/material.dart';

class MealList extends ListView {
  MealList({
    super.key,
    super.padding,
    required super.itemBuilder,
    required super.itemCount,
    IndexedWidgetBuilder? separatorBuilder,
  }) : super.separated(
         separatorBuilder:
             separatorBuilder ?? (context, index) => SizedBox(height: 8),
         physics: ClampingScrollPhysics(
           parent: AlwaysScrollableScrollPhysics(),
         ),
         shrinkWrap: false,
       );
}
