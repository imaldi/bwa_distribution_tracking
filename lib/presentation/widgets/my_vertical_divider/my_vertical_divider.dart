import 'package:flutter/material.dart';

import '../../../core/resources/consts/sizes.dart';

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets
          .symmetric(
          vertical: sizeNormal),
      child: Row(children: [
        VerticalDivider(color: Colors.white,thickness: 2.0,),
      ],),
    );
  }
}
