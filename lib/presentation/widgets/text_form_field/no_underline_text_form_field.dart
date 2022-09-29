import 'package:flutter/material.dart';

class NoUnderlineTextFormField extends StatelessWidget {
  const NoUnderlineTextFormField({
    this.onTap,
    this.decoration = const InputDecoration(),
    this.obscureText = false,
    this.controller,
    Key? key,
  }) : super(key: key);
  final Function()? onTap;
  final InputDecoration decoration;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
