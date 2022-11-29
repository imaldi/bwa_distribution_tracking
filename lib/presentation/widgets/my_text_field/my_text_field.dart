import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  const MyTextField({this.label,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: primaryGreen, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(sizeNormal)));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(sizeMedium),
          labelText: label,
          labelStyle: const TextStyle(color: primaryGreen),
          border: primaryBorder,
          focusedBorder: primaryBorder,
          enabledBorder: primaryBorder,
          disabledBorder: primaryBorder,
        ),
      ),
    );
  }
}