import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../../../core/resources/media_query/media_query_helpers.dart';
import '../text/custom_text.dart';

class CustomAppbarContainer extends StatelessWidget {
  final Widget child;
  final String? titleText;
  const CustomAppbarContainer({required this.child, this.titleText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(sizeMedium),
      width: orientedWidthScreen(context,
          portraitRatio: 1, landscapeRatio: 1),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.centerLeft, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: CustomText(
                      "$titleText",
                      color: Colors.white,
                      size: sizeMedium,
                    ))
              ],
            ),
            InkWell(
              onTap: () {
                context.router.pop();
              },
              child: const Icon(
                Icons.keyboard_arrow_left_outlined,
                color: Colors.white,
                size: sizeBig,
              ),
            ),
          ]),

          child,
        ],
      ),
    );
  }
}
