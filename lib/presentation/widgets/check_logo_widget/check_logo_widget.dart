import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/consts/sizes.dart';

class CheckLogoWidget extends StatelessWidget {
  const CheckLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                                   Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: sizeMedium,
            width: sizeMedium,
            child: Container(color: Colors.white,)),
        SizedBox(
          height: sizeMedium + sizeNormal,
          width: sizeMedium + sizeNormal,
          child: SvgPicture.asset(
              "assets/images/check_icon.svg"),
        ),
      ],
    );
  }
}
