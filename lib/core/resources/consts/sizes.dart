import 'package:flutter/material.dart';

const sizeTiny = 2.0;
const sizeSmall = 4.0;
const sizeNormal = 8.0;
const sizeMedium = 16.0;
const sizeBig = 32.0;
const sizeHuge = 64.0;
double widthScreen(context) => MediaQuery.of(context).size.width;
double heightScreen(context) => MediaQuery.of(context).size.height;
screenOrientation(context) => MediaQuery.of(context).orientation;
const globalPaddingSize = sizeMedium;