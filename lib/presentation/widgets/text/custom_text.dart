import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.data,
      {Key? key,
      this.color,
      this.size,
      this.textAlign,
      this.weight,
      this.decoration,
      this.shadows,
      this.letterSpacing})
      : super(key: key);
  final String data;
  final Color? color;
  final double? size;
  final double? letterSpacing;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          decoration: decoration,
          decorationThickness: 2,
          decorationColor: shadows?.first.color,
          letterSpacing: letterSpacing,
          shadows: shadows),
      softWrap: true,
    );
  }
}
