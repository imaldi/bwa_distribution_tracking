import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../container/rounded_container.dart';
import '../custom_appbar_container/custom_appbar_container.dart';
import '../my_text_field/my_text_field.dart';
import '../text/custom_text.dart';

class RiwayatScreenAppbarAndSearchbar extends StatelessWidget {
  final bool isByQRSJ;

  const RiwayatScreenAppbarAndSearchbar({this.isByQRSJ = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Colors.white,
      child: Column(
        children: [
          CustomAppbarContainer(
            titleText: "Riwayat Distribusi",
          ),
          Container(
            padding: const EdgeInsets.all(sizeNormal),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        color: Colors.white,
                        margin:
                            const EdgeInsets.symmetric(horizontal: sizeNormal),
                        child: const MyTextField(
                          contentPadding: EdgeInsets.all(sizeNormal),
                          borderRadius: sizeMedium,
                        ))),
                Visibility(
                  visible: !isByQRSJ,
                  child: RoundedContainer(
                    sizeMedium,
                    boxDecoration: const BoxDecoration(color: primaryColor),
                    child: Row(
                          children: const [
                            CustomText(
                              "Filter",
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
