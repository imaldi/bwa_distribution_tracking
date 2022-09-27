import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/custom_expanded/single_child_expanded_row.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/resources/consts/colors.dart';
import '../../core/resources/gradients/basic_linear_gradient.dart';
import '../../core/resources/media_query/media_query_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              // color: Colors.blue,
              height: 3 * heightScreen(context) / 4,
              width: widthScreen(context),
              padding: const EdgeInsets.fromLTRB(sizeBig, sizeBig, sizeBig,0),
              decoration: BoxDecoration(
                gradient: basicDiagonalGradient(),
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(sizeBig),
                    bottomRight: Radius.circular(sizeBig)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_circle,
                              size: 100,
                            ),
                            // Image.asset("assets/images/foto_profil_dummy.png"),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: sizeNormal,
                                  horizontal: screenOrientation(context) ==
                                          Orientation.portrait
                                      ? widthScreen(context) / 16
                                      : widthScreen(context) / 6),
                              child: const FittedBox(
                                child: CustomText(
                                  "SELAMAT DATANG PETUGAS",
                                  color: Colors.white,
                                  size: sizeBig,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: sizeMedium),
                              child: FittedBox(
                                  child: CustomText(
                                "Mamat Untung",
                                color: Colors.white,
                                size: sizeHuge,
                              )),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  0, sizeBig, 0, sizeNormal),
                              child: Column(
                                children: [
                                  const CustomText(
                                    "Masukkan UPC Anda",
                                    color: Colors.white,
                                    weight: FontWeight.w600,
                                  ),
                                  SingleChildExpandedRow(
                                    child: RoundedContainer(
                                      sizeMedium,
                                      boxDecoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3.0, color: Colors.white),
                                        color: Colors.transparent,
                                      ),
                                      child: Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: sizeMedium),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: sizeMedium,
                                              vertical: sizeNormal),
                                          child: const Center(
                                              child: CustomText(
                                            "Kode UPC",
                                            color: Colors.white,
                                          ))),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: sizeMedium),
                                      height: 100,
                                      width: widthScreen(context),
                                      child: Card(
                                        color: Color(0xFF00D3AD),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Container(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(height: sizeNormal),
                                            CustomText(
                                              "Total Stack Keseluruhan",
                                              color: Colors.white,
                                            ),
                                            Expanded(
                                                child: FittedBox(
                                                    child: CustomText(
                                              "50000",
                                              color: Colors.white,
                                              size: sizeHuge * 2,
                                            ))),
                                          ],
                                        )),
                                      )),
                                  SizedBox(
                                    width: widthScreen(context),
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: sizeSmall),
                                            height: 100,
                                            child: Card(
                                              color: Color(0xFFFFB259),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                  padding: EdgeInsets.only(bottom: sizeNormal),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: const [
                                                      SizedBox(height: sizeNormal),
                                                      Flexible(
                                                        child: FittedBox(
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: sizeNormal),
                                                            child: CustomText(
                                                              "Stock Dalam Proses",
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: FittedBox(
                                                            child: CustomText(
                                                              "50000",
                                                              color: Colors.white,
                                                              size: sizeBig,
                                                            ),
                                                          )),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            padding: EdgeInsets.symmetric(vertical: sizeSmall),
                                            child: Card(
                                              color: Color(0xFF9059FF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                  padding: EdgeInsets.only(bottom: sizeNormal),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: const [
                                                      SizedBox(height: sizeNormal),
                                                      Flexible(
                                                        child: FittedBox(
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: sizeNormal),
                                                            child: CustomText(
                                                              "Stock Selesai Diterima",
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: FittedBox(
                                                            child: CustomText(
                                                              "50000",
                                                              color: Colors.white,
                                                              size: sizeBig,
                                                            ),
                                                          )),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                        // ]..map((e) => Expanded(child: e)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]..map((e) => Expanded(child: e))
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(bottom: sizeBig),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedContainer(sizeMedium,
                      padding: EdgeInsets.all(sizeBig),
                      margin: EdgeInsets.only(right: sizeMedium, left: sizeMedium, top: sizeMedium, bottom: sizeNormal),
                      boxDecoration: const BoxDecoration(color: primaryBlue),
                      child: SvgPicture.asset("assets/images/camera_white.svg"),
                    ),
                    CustomText("Bulk Scan",textAlign: TextAlign.center,color: primaryBlue,)
                  ],
                ),
                Column(
                  children: [
                    RoundedContainer(sizeMedium,
                      padding: EdgeInsets.all(sizeBig),
                      margin: EdgeInsets.only(right: sizeMedium, left: sizeMedium, top: sizeMedium, bottom: sizeNormal),
                      boxDecoration: const BoxDecoration(color: primaryGreen),
                      child: SvgPicture.asset("assets/images/camera_white.svg"),
                    ),
                    CustomText("Single Scan",textAlign: TextAlign.center,color: primaryGreen,)
                  ],
                ),
              ]
              //   ..map((e) => RoundedContainer(
              //   sizeNormal,
              //   child: e,
              //   boxDecoration: BoxDecoration(color: Colors.green),
              // ))
              ,
            ),
          ),
        ],
      ),
    ));
  }
}
