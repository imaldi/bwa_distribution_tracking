import 'package:flutter/material.dart';

double widthScreen(BuildContext context) => MediaQuery.of(context).size.width;
double heightScreen(BuildContext context) => MediaQuery.of(context).size.height;
Orientation screenOrientation(BuildContext context) =>
    MediaQuery.of(context).orientation;

T orientedValueOf<T>(BuildContext context,
        {required T portraitValue, required T landscapeValue}) =>
    screenOrientation(context) == Orientation.portrait
        ? portraitValue
        : landscapeValue;
double orientedWidthScreen(BuildContext context,
        {required double portraitRatio, required double landscapeRatio}) =>
    screenOrientation(context) == Orientation.portrait
        ? widthScreen(context) * portraitRatio
        : widthScreen(context) * landscapeRatio;
double orientedHeightScreen(BuildContext context,
        {required double portraitRatio, required double landscapeRatio}) =>
    screenOrientation(context) == Orientation.portrait
        ? heightScreen(context) * portraitRatio
        : heightScreen(context) * landscapeRatio;
