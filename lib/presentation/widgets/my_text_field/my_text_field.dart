import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  const MyTextField({this.contentPadding, this.label, this.borderRadius, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: primaryGreen, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? sizeNormal)));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: contentPadding ?? const EdgeInsets.all(sizeMedium),
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