import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../container/rounded_container.dart';
import '../custom_appbar_container/custom_appbar_container.dart';
import '../my_text_field/my_text_field.dart';
import '../text/custom_text.dart';

class RiwayatScreenAppbarAndSearchbar extends StatelessWidget {
  final bool isByQRSJ;
  final void Function()? onEditingComplete;
  final void Function(String)? onScanComplete;
  final TextEditingController? controller;

  const RiwayatScreenAppbarAndSearchbar(
      {this.controller,
      this.onEditingComplete,
      this.onScanComplete,
      this.isByQRSJ = false,
      Key? key})
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
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                await BarcodeScanner.scan()
                                    .then((ScanResult noSj) {
                                  if (onScanComplete != null) {
                                    onScanComplete!(noSj.rawContent);
                                  }
                                });
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.only(right: sizeMedium),
                                  child: SvgPicture.asset(
                                      "assets/images/scan_mini_icon.svg")),
                            ),
                            Expanded(
                              child: MyTextField(
                                controller: controller,
                                contentPadding: EdgeInsets.all(sizeNormal),
                                borderRadius: sizeMedium,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: primaryGreen,
                                ),
                                onEditingComplete: onEditingComplete,
                                maxLines: 1,
                                textInputAction: TextInputAction.go,
                              ),
                            ),
                          ],
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
