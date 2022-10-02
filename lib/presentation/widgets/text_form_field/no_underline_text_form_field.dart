import 'package:flutter/material.dart';

class NoUnderlineTextFormField extends StatelessWidget {
  const NoUnderlineTextFormField({
    this.onTap,
    this.decoration = const InputDecoration(),
    this.obscureText = false,
    this.controller,
    Key? key,
    this.keyboardType,
    this.onChanged,
    this.textAlign,
    this.style,
  }) : super(key: key);
  final Function()? onTap;
  final InputDecoration decoration;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      controller: controller,
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: decoration.copyWith(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
