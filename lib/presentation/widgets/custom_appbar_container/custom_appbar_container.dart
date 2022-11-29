import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';

class CustomAppbarContainer extends StatelessWidget {
  final Widget child;
  const CustomAppbarContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(sizeMedium),
      decoration: const BoxDecoration(
        // gradient: basicDiagonalGradient(),
        color: primaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: AssetImage("assets/images/background_main.png"),
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(sizeBig),
            bottomRight: Radius.circular(sizeBig)),
      ),
      child: child,
    );
  }
}
