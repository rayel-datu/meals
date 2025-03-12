import 'package:flutter/material.dart';

class MealTextFormField extends TextFormField {
  MealTextFormField({
    super.key,
    super.controller,
    String? hintText,
    super.onChanged,
    super.enabled
  }) : super(
         decoration: InputDecoration(
           hintText: hintText,
           suffix: IconButton(
             onPressed: () {
               controller?.clear();
               onChanged?.call('');
             },
             icon: Icon(Icons.clear),
           ),
         ),
       );
}
