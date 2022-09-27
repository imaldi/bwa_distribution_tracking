import 'package:flutter/material.dart';

double widthScreen(context) => MediaQuery.of(context).size.width;
double heightScreen(context) => MediaQuery.of(context).size.height;
Orientation screenOrientation(context) => MediaQuery.of(context).orientation;