import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final bool? enabled;
  const MyTextField({this.enabled, this.onEditingComplete, this.contentPadding, this.keyboardType, this.onSaved, this.controller, this.label, this.borderRadius, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: primaryGreen, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? sizeNormal)));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        onSaved: (val){
          if(onSaved != null){
            print("VALUE: $val");
            onSaved!(val);
          }
        },
        onEditingComplete: onEditingComplete,
        keyboardType: keyboardType,
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