import 'package:flutter/material.dart';

Gradient basicLinearGradient(){
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.blue,
      Colors.green,
    ],
  );
}