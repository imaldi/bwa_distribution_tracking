import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_dropdown_button/my_dropdown_button.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/consts/sizes.dart';
import '../../injection_container.dart';
import '../blocs/scan/cubit/bulk_scan_screen_cubit.dart';
import '../widgets/container/rounded_container.dart';
import '../widgets/custom_appbar_container/custom_appbar_container.dart';
import '../widgets/my_text_field/my_text_field.dart';
import '../widgets/text/custom_text.dart';

class SingleScanScreen extends StatefulWidget implements AutoRouteWrapper {
  final String qrcodeSj;
  const SingleScanScreen({required this.qrcodeSj, super.key});

  @override
  State<StatefulWidget> createState() => _SingleScanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return
      MultiBlocProvider(providers: [
        BlocProvider.value(value: sl<BulkScanScreenCubit>())
      ], child: this);
  }
}

class _SingleScanScreenState extends State<SingleScanScreen> {
  var controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<BulkScanScreenCubit>().getCurrentCoordinateAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Single Scan"),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              CustomAppbarContainer(titleText:"Single Scan",child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: sizeNormal,vertical: sizeMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("Petugas",weight:FontWeight.bold,color: Colors.white,),
                    // Fixme pakai data user disini
                    CustomText("Mamat Untung",color: Colors.white,),
                  ],
                ),
              )),
              Container(
                margin: const EdgeInsets.only(bottom: sizeHuge * 2,left: sizeMedium, top:sizeMedium, right: sizeMedium, ),
                child: Column(
                  children: [
                    const MyTextField(
                      label: 'Nama Penerima',
                    ),
                    const MyTextField(
                      label: 'No Hp',
                    ),
                    const MyTextField(
                      label: 'Nama Lembaga',
                    ),
                    const MyTextField(
                      label: 'Tempat Tujuan',
                    ),
                    // Fixme lebih dari 1 baris (freetext)
                    const MyTextField(
                      label: 'Detail Alamat',
                    ),
                    const MyTextField(
                      label: 'Kelurahan',
                    ),
                    const MyTextField(
                      label: 'Kecamatan',
                    ),
                    const MyTextField(
                      label: 'Kota/Kabupaten',
                    ),
                    const MyTextField(
                      label: 'Provinsi',
                    ),
                    // Fixme lebih dari satu baris
                    Builder(
                      builder: (context) {
                        var state = context.watch<BulkScanScreenCubit>().state.address;
                        return MyTextField(
                          label: 'Google Address',
                          controller: TextEditingController(text: state),
                        );
                      }
                    ),
                    MyDropdownButton<String>(
                      const ["Dikirim", "Sampai"],
                      (v) => v,
                      hint: const CustomText("Status Pengiriman",
                          color: primaryGreen),
                      margin: const EdgeInsets.symmetric(vertical: sizeNormal),
                      onItemTapped: (val){

                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            // context.router.push(
                            //     const TestDhriveRoute()
                            // );
                            await BarcodeScanner.scan()
                                .then((ScanResult bulkDetail) {
                              if (bulkDetail.rawContent.isNotEmpty) {
                                myToast(bulkDetail.rawContent);
                                // var qrBloc =
                                // context.read<QRScanBloc>();
                                // print(
                                //     "bulkDetail ${bulkDetail.rawContent}");
                                // qrBloc.add(BulkQRScanEvent(
                                //     bulkDetail.rawContent));
                                // context.router.push(BulkScanRoute(
                                //     qrScanBloc: qrBloc));
                              }
                            });
                          },
                          child: const RoundedContainer(
                            sizeMedium,
                            padding: EdgeInsets.all(sizeBig),
                            margin: EdgeInsets.only(
                                right: sizeMedium,
                                left: sizeMedium,
                                top: sizeMedium,
                                bottom: sizeNormal),
                            boxDecoration: BoxDecoration(color: primaryColor),
                            child: Icon(
                              Icons.qr_code_2,
                              color: Colors.white,
                              size: sizeHuge,
                            ),
                            // SvgPicture.asset(
                            //     "assets/images/camera_white.svg"),
                          ),
                        ),
                        const CustomText(
                          "Surat Jalan",
                          textAlign: TextAlign.center,
                          color: primaryColor,
                        )
                      ]..map((e) => FittedBox(
                            child: e,
                          )),
                    ),
                    Container(
                      height: 200,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(bottom: sizeBig),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          // gradient: basicDiagonalGradient(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(sizeMedium))),
                      child: NotificationListener<OverscrollNotification>(
                        onNotification: (OverscrollNotification value) {
                          if (value.overscroll < 0 &&
                              controller.offset + value.overscroll <= 0) {
                            if (controller.offset != 0) controller.jumpTo(0);
                            return true;
                          }
                          if (controller.offset + value.overscroll >=
                              controller.position.maxScrollExtent) {
                            if (controller.offset !=
                                controller.position.maxScrollExtent) {
                              controller
                                  .jumpTo(controller.position.maxScrollExtent);
                            }
                            return true;
                          }
                          controller.jumpTo(controller.offset + value.overscroll);
                          return true;
                        },
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          // padding: const EdgeInsets.all(sizeNormal),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 15,
                          itemBuilder: (cont, ind) {
                            return Container(
                              color: ind % 2 == 0 ? null : primaryDarkerColor,
                              child: ListTile(
                                  title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: FittedBox(
                                    child: CustomText(
                                  "$ind No Dus: 003SJPJ22 - MERANTI00098-0002-$ind",
                                  color: Colors.white,
                                )),
                              )),
                            );
                          },
                        ),
                      ),

                      // Column(
                      //     children: [
                      //     ])
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              myToast("Upload Foto");
                            },
                            child: RoundedContainer(sizeNormal,
                                constraints:
                                    const BoxConstraints(minWidth: sizeHuge + 30),
                                boxDecoration:
                                    const BoxDecoration(color: primaryGreen),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: sizeHuge,
                                    ),
                                    FittedBox(
                                        child: CustomText(
                                      "Upload",
                                      color: Colors.white,
                                    )),
                                  ],
                                )),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              myToast("Take Photo");
                            },
                            child: RoundedContainer(sizeNormal,
                                constraints:
                                    const BoxConstraints(minWidth: sizeHuge + 30),
                                boxDecoration:
                                    const BoxDecoration(color: primaryGreen),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: sizeHuge,
                                    ),
                                    FittedBox(
                                        child: CustomText(
                                      "Take Photo",
                                      color: Colors.white,
                                    )),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: sizeMedium,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                context.router
                                    .push(const RiwayatSuratJalanRoute());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor),
                              child: const Text("Simpan")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
