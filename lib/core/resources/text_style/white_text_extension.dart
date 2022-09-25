import 'package:flutter/material.dart';

extension TextExtension on Text{
  // Widget  horizontalPadding(double padding)=>Padding(
  //     padding:EdgeInsets.symmetric(horizontal: padding),
  //     child:this);
  // Widget center()=> Center(child:this);
  Text white() => Text(data ?? "",style: (style ?? const TextStyle()).copyWith(color: Colors.white));
  Text color(Color? colors) => Text(data ?? "",style: (style ?? const TextStyle()).copyWith(color: colors));
  Text size(double? size) => Text(data ?? "",style: (style ?? const TextStyle()).copyWith(fontSize: size),);

}