import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/gradients/basic_linear_gradient.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/cubit/bulk_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/image_picker/my_image_picker.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_dropdown_button/my_dropdown_button.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_paginator/my_paginator.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text_form_field/no_underline_text_form_field.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BulkScanScreen extends StatefulWidget implements AutoRouteWrapper {
  final QRScanBloc qrScanBloc;
  final bool firstTimeScan;

  const BulkScanScreen(
      {required this.qrScanBloc, this.firstTimeScan = true, Key? key})
      : super(key: key);

  @override
  State<BulkScanScreen> createState() => _BulkScanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: qrScanBloc,
        ),
        BlocProvider.value(value: sl<BulkScanScreenCubit>())
      ],
      child: this,
    );
  }
}

class _BulkScanScreenState extends State<BulkScanScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.firstTimeScan) {
      context.read<BulkScanScreenCubit>().getCurrentCoordinateAndAddress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  // width: orientedWidthScreen(context,
                  //     portraitRatio: 1, landscapeRatio: 1),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.centerLeft, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Center(
                                child: CustomText(
                              "Detail Barang",
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
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(sizeMedium),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  FittedBox(
                                      child: CustomText(
                                    "Total Al-Quran Keseluruhan",
                                    color: Colors.white,
                                    size: sizeMedium,
                                  )),
                                  FittedBox(
                                      child: CustomText(
                                    "50.000",
                                    color: Colors.white,
                                    size: sizeHuge - 10,
                                    weight: FontWeight.bold,
                                  )),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(sizeMedium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        FittedBox(
                                            child: CustomText(
                                          "Al-Quran diproses",
                                          color: Colors.white,
                                          size: sizeMedium,
                                        )),
                                        FittedBox(
                                            child: CustomText(
                                          "50.000",
                                          color: Colors.white,
                                          size: sizeHuge,
                                          weight: FontWeight.bold,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(sizeMedium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        FittedBox(
                                            child: CustomText(
                                          "Al-Quran Selesai",
                                          color: Colors.white,
                                          size: sizeMedium,
                                        )),
                                        FittedBox(
                                            child: CustomText(
                                          "50.000",
                                          color: Colors.white,
                                          size: sizeHuge,
                                          weight: FontWeight.bold,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    var name = "";
                    if (state is AuthSuccess) {
                      name = state.loginResponse.user?.name ?? "";
                    }

                    return BlocConsumer<QRScanBloc, QRScanState>(
                      listener: (context, state) {
                        if (state is SendScanSuccess) {
                          myToast("Send Scan Success");
                          // context.router.pop();
                          context.router.replace(const HistoryRoute());
                        }
                      },
                      builder: (context, state) {
                        // var response;

                        if (state is QRScanLoading) {
                          return SizedBox(
                            height: heightScreen(context) / 4,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: primaryGreen,
                              ),
                            ),
                          );
                        }
                        if (state is QRScanFailed) {
                          // response = "null";
                          myToast("Mohon maaf, ada kesalahan");
                          context.router.pop();
                        }
                        if (state is QRBulkScanSuccess) {
                          // response = state.bulkScanResponse;
                          var data = state.bulkScanResponse.data?.first;
                          var details = state.bulkScanResponse.detail;
                          var dataPerPage = details?.data;
                          var textColor = primaryColor;
                          return Padding(
                            padding: const EdgeInsets.all(sizeMedium),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RoundedContainer(sizeMedium,
                                    padding: const EdgeInsets.all(sizeMedium),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: sizeBig),
                                    boxDecoration: BoxDecoration(
                                        border: Border.all(color: textColor)
                                        // color: primaryColor,
                                        // gradient: basicDiagonalGradient(),
                                        ),
                                    child: Column(
                                      children: [
                                        const CustomText(
                                          "NOMOR ID",
                                          color: primaryGreen,
                                          weight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          "${data?.nosj}",
                                          color: primaryGreen,
                                          weight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: sizeBig,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: CustomText(
                                              "Tanggal",
                                              color: textColor,
                                            )),
                                            Expanded(
                                                child: CustomText(
                                              ": ${data?.tanggal}",
                                              color: textColor,
                                            )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: CustomText(
                                              "Nomor PC/PO",
                                              color: textColor,
                                            )),
                                            Expanded(
                                                child: CustomText(
                                              ": ${data?.nopc}",
                                              color: textColor,
                                            )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: CustomText(
                                              "No Polisi",
                                              color: textColor,
                                            )),
                                            Expanded(
                                                child: CustomText(
                                              ": ${data?.nopol}",
                                              color: textColor,
                                            )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: CustomText(
                                              "Nama Ekspedisi",
                                              color: textColor,
                                            )),
                                            Expanded(
                                                child: CustomText(
                                              ": ${data?.dikirimBy}",
                                              color: textColor,
                                            )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: CustomText(
                                              "Nama Pengemudi",
                                              color: textColor,
                                            )),
                                            Expanded(
                                                child: CustomText(
                                              ": 05-09-2022",
                                              color: textColor,
                                            )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: CustomText(
                                              "Alamat Pengirimiman",
                                              color: textColor,
                                            )),
                                            Expanded(
                                                child: CustomText(
                                              ": ${data?.alamat}",
                                              color: textColor,
                                            )),
                                          ],
                                        ),
                                      ],
                                    )),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      // gradient: basicDiagonalGradient(),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(sizeMedium))),
                                  child: Column(
                                    children: [
                                      // const CustomText("Sedang perbaikan",color: Colors.white,),

                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        // padding: const EdgeInsets.all(sizeNormal),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: state.bulkScanResponse.detail
                                            ?.data?.length,
                                        itemBuilder: (cont, ind) {
                                          return Container(
                                            color: ind % 2 == 0
                                                ? null
                                                : primaryDarkerColor,
                                            child: ListTile(
                                                title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: FittedBox(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    sizeNormal),
                                                        decoration: const BoxDecoration(
                                                            border: Border(
                                                                right: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .white))),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomText(
                                                                "Kode Batch: ${dataPerPage?[ind].kodeBatch}",
                                                                color: Colors
                                                                    .white),
                                                            CustomText(
                                                              "Nama Barang (Project): ${dataPerPage?[ind].nmProject}",
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: FittedBox(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    sizeNormal),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // FIXME tanyakan soal field yang benar
                                                            CustomText(
                                                                "QTY: ${dataPerPage?[ind].jmlKeluar}",
                                                                color: Colors
                                                                    .white),
                                                            CustomText(
                                                                "Jumlah: ${dataPerPage?[ind].jmlKeluar}",
                                                                color: Colors
                                                                    .white),
                                                            CustomText(
                                                                "Satuan: ${dataPerPage?[ind].jmlKeluar}",
                                                                color: Colors
                                                                    .white),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  // CustomText("Kode Batch: ${details?[ind].kodeBatch}"),
                                                ],
                                              ),
                                            )),
                                          );
                                        },
                                      ),
                                      Container(
                                          padding:
                                              const EdgeInsets.all(sizeMedium),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MyPaginator(
                                                pageLength:
                                                    ((details?.total ?? 1) ~/
                                                            (details?.perPage ??
                                                                1)) +
                                                        1,
                                                onPageChanged: (index) {
                                                  myToast(index.toString());
                                                },
                                                primaryColor: Colors.white,
                                                secondaryColor: primaryColor,
                                              ),
                                              const CustomText(
                                                "TOTAL QTY, PACKING DAN BERAT",
                                                color: Colors.white,
                                                weight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                size: sizeMedium,
                                              ),
                                              CustomText(
                                                "QTY: ${data?.total} | Berat: 1270 KG",
                                                color: Colors.white,
                                              ),
                                              const CustomText(
                                                "TOTAL STOCK: 30.000",
                                                color: Colors.white,
                                                weight: FontWeight.bold,
                                                size: sizeMedium,
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                                // TODO remove this and its bloc
                                Visibility(
                                  visible: false,
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: sizeBig),
                                          child: const CustomText(
                                            "Lokasi Anda",
                                            color: primaryGreen,
                                            size: sizeMedium,
                                            weight: FontWeight.w600,
                                          )),
                                      BlocBuilder<BulkScanScreenCubit,
                                          BulkScanScreenState>(
                                        builder: (context, state) {
                                          var text =
                                              "${state.sendScanDataModel.latitude ?? "?"}, ${state.sendScanDataModel.longtitude ?? "?"}";
                                          return RoundedContainer(sizeNormal,
                                              boxDecoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: primaryGreen)),
                                              child: NoUnderlineTextFormField(
                                                controller:
                                                    TextEditingController(
                                                        text: text),
                                                enabled: false,
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: widget.firstTimeScan,
                                  child: Padding(
                                    padding: const EdgeInsets.all(sizeMedium),
                                    child: MyDropdownButton<String>(
                                      ["Dropship", "Pengiriman"],
                                      (v) => v,
                                      onItemTapped: (val) {
                                        context
                                            .read<BulkScanScreenCubit>()
                                        .updateModelState((dataModel){
                                          return dataModel.copyWith(statusPengiriman: val);
                                        });
                                      },
                                      hint: const Text(
                                        "Status Pengiriman",
                                        style: TextStyle(color: primaryGreen),
                                      ),
                                    ),
                                  ),
                                ),

                                ElevatedButton(
                                    onPressed: () {
                                      var model = context
                                          .read<BulkScanScreenCubit>()
                                          .state
                                          .sendScanDataModel;
                                      context
                                          .read<QRScanBloc>()
                                          .add(SendScanEvent(model));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor),
                                    child: const Text("Simpan")),
                                // TODO pindahkan ke halaman scan dus
                                Visibility(
                                  visible: false,
                                  child: Column(
                                    children: [
                                      MyImagePickerWidget(
                                        //   setImageFilePath: (numb, theImage) => (){
                                        //   print("INI NOMOR: $numb");
                                        //   print("The Path: ${theImage?.path ?? ""}");
                                        //   context.read<BulkScanScreenCubit>().setFotoPath(theImage?.path ?? "");
                                        // },
                                        functionCallbackSetImageFilePath:
                                            (numb, theImage) async {
                                          // var size = theImage.runtimeType().toString();
                                          print("INI NOMOR: $numb");
                                          print(
                                              "The Path: ${theImage?.path ?? ""}");
                                          print(
                                              "foto size: ${theImage.runtimeType}");

                                          context
                                              .read<BulkScanScreenCubit>()
                                              .setFotoPath(
                                                  theImage?.path ?? "");
                                        },
                                        defaultImagePlaceholder: FittedBox(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(sizeBig),
                                            child: RoundedContainer(
                                              sizeNormal,
                                              height:
                                                  widthScreen(context) * 0.4,
                                              width: widthScreen(context) * 0.4,
                                              boxDecoration:
                                                  const BoxDecoration(
                                                      color: Colors.grey),
                                              child: const Center(
                                                child: FittedBox(
                                                  child: CustomText(
                                                    "No Picture",
                                                    color: Colors.white,
                                                    size: sizeBig,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                context.router
                                                    .push(const HistoryRoute());
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      primaryColor),
                                              child: const Text("History")),
                                          Builder(builder: (context) {
                                            return ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        primaryColor),
                                                child: const Text("Simpan"));
                                          }),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: true,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.router
                                              .push(const SingleScanRoute());
                                        },
                                        child: RoundedContainer(
                                          sizeMedium,
                                          padding:
                                              const EdgeInsets.all(sizeBig),
                                          margin: const EdgeInsets.only(
                                              right: sizeMedium,
                                              left: sizeMedium,
                                              top: sizeMedium,
                                              bottom: sizeNormal),
                                          boxDecoration: const BoxDecoration(
                                              color: primaryColor),
                                          child: SvgPicture.asset(
                                              "assets/images/camera_white.svg"),
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
                                )
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
