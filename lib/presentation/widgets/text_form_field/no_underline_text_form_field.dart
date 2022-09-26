import 'package:flutter/material.dart';

class NoUnderlineTextFormField extends StatelessWidget {
  const NoUnderlineTextFormField(
      {
        this.onTap,
        this.decoration = const InputDecoration(),
        this.obscureText = false,
        Key? key})
      : super(key: key);
  final Function()? onTap;
  final InputDecoration decoration;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText,
      decoration: decoration.copyWith(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
