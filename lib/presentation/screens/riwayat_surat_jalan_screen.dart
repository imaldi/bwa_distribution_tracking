import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_text_field/my_text_field.dart';
import 'package:flutter/material.dart';

import '../../core/resources/consts/colors.dart';
import '../../core/resources/consts/sizes.dart';
import '../widgets/custom_appbar_container/custom_appbar_container.dart';
import '../widgets/riwayat_screen_appbar_and_searchbar/riwayat_screen_appbar_and_searchbar.dart';
import '../widgets/text/custom_text.dart';

class RiwayatSuratJalanScreen extends StatelessWidget {
  const RiwayatSuratJalanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: ListView.builder(
                    // padding: EdgeInsets.only(
                    //     top: orientedHeightScreen(context,
                    //         portraitRatio: 0.15, landscapeRatio: 0.15)),
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 15+1,
                    itemBuilder: (c, i) {
                      if(i == 0) {
                        return RiwayatScreenAppbarAndSearchbar();
                      }
                      return InkWell(
                        onTap: () {
                          // var qrBloc = context.read<QRScanBloc>();
                          // qrBloc.add(BulkQRScanEvent(
                          //   // textValue
                          //   // controller.text
                          //     "${listSJ?[i].qrcodeSj}"));
                          // context.router.push(BulkScanRoute(
                          //     qrScanBloc: qrBloc,
                          //     firstTimeScan: false));
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Card(
                                color: Colors.white,
                                // i % 2 == 0 ? listColorLight : listColorDark,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        "Kode Surat Jalan :",
                                        color: primaryColor,
                                        size: sizeMedium,
                                      ),
                                      FittedBox(
                                          child: CustomText(
                                        // "003/SPJ/22-MERANTI00098-000${i + 1}",
                                        "sadasdsa $i",
                                        color: primaryColor,
                                        size: sizeMedium+sizeSmall,
                                        weight: FontWeight.bold,
                                      )),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: sizeNormal),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Flexible(
                                                child:CustomText(
                                        "21 Oct 2022 . 16.00 | ",
                                          color: primaryColor,
                                        ),
                                      ),
                                            Flexible(
                                                child: CustomText(
                                                  "Total 200",
                                                  color: primaryColor,
                                                ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                              constraints: const BoxConstraints(
                                  minWidth: sizeHuge+sizeNormal,
                                  maxWidth: sizeHuge+sizeNormal,
                              ),
                              margin: const EdgeInsets.only(top: sizeNormal),
                              padding: const EdgeInsets.symmetric(horizontal: sizeNormal, vertical: 0),
                                decoration: const BoxDecoration(color: primaryGreen,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(sizeMedium), bottomLeft: Radius.circular(sizeMedium)),
                                ),
                                child: const Center(child: FittedBox(child: CustomText("hey",color: Colors.white,))))
                          ],
                        ),
                      );
                    }),
              ),
              IntrinsicHeight(
                child: Container(
                    color: Colors.white,
                    child: RiwayatScreenAppbarAndSearchbar()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
