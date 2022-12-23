import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_model.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/bulk_scan/bulk_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/scan/qr_scan_bloc.dart';
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

import '../../data/models/qr_scan/bulk_q_r_scan_model.dart';
import '../state_management/blocs/auth/auth_bloc.dart';
import '../widgets/my_text_field/my_text_field.dart';

class BulkScanScreen extends StatefulWidget implements AutoRouteWrapper {
  final QRScanBloc qrScanBloc;
  final String qrCode;
  final bool firstTimeScan;

  const BulkScanScreen(
      {required this.qrScanBloc,
      this.firstTimeScan = true,
      required this.qrCode,
      Key? key})
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
  BulkQRScanModel? model;
  TextEditingController keteranganCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if (widget.firstTimeScan) {
    context.read<BulkScanScreenCubit>().getCurrentCoordinateAndAddress();
    context.read<BulkScanScreenCubit>().updateModelState((dataModel) {
      return dataModel.copyWith(qrCodeSJ: widget.qrCode ?? "-");
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: BlocConsumer<QRScanBloc, QRScanState>(
              listener: (context, state) {
                if (state is QRBulkScanSuccess) {
                  context.read<BulkScanScreenCubit>().updateModelState(
                      (model) => model.copyWith(
                          nosj: state.bulkScanResponse.data?.first.nosj));
                }

                if (state is SendScanSuccess) {
                  myToast("Send Scan Success");
                  // context.router.pop();
                  // model = state.bulkScanResponse.data?.first;

                  if (model?.qrcodeSj != null) {
                    context.router.replace(DetailPengirimanRoute(
                        qrCode: model?.qrcodeSj ?? "null"));
                  }
                }

                if (state is QRScanFailed) {
                  if (state.failure is DataNotFoundFailure) {
                    myToast("Maaf, data tidak ditemukan");
                  }
                  context.router.pop();
                }
              },
              builder: (context, state) {
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
                // if (state is QRScanFailed) {
                //   // response = "null";
                //   myToast("Mohon maaf, ada kesalahan");
                //   context.router.pop();
                // }
                if (state is QRBulkScanSuccess) {
                  // response = state.bulkScanResponse;
                  var headerDataList = state.bulkScanResponse.header;
                  var headerData = const SuratJalanModel();
                  if (headerDataList != null &&
                      (headerDataList.length ?? 0) > 0) {
                    headerData = headerDataList[0];
                  }
                  var data = state.bulkScanResponse.data?.first;
                  model = state.bulkScanResponse.data?.first;
                  var details = state.bulkScanResponse.detail;
                  var dataPerPage = details?.data;
                  var textColor = primaryColor;
                  return Column(
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
                            image:
                                AssetImage("assets/images/background_main.png"),
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
                                    padding: const EdgeInsets.only(
                                        top: sizeMedium,
                                        bottom: sizeMedium,
                                        right: sizeMedium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const FittedBox(
                                            child: CustomText(
                                          "Total Al-Quran Keseluruhan",
                                          color: Colors.white,
                                          size: sizeMedium,
                                        )),
                                        FittedBox(
                                            child: CustomText(
                                          "${data?.total ?? 0}",
                                          color: Colors.white,
                                          size: sizeHuge - 10,
                                          weight: FontWeight.bold,
                                        )),
                                      ],
                                    ),
                                  ),
                                  Table(
                                    children: [
                                      const TableRow(children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: UnconstrainedBox(
                                            child: FittedBox(
                                              child: CustomText(
                                                "Al-Quran diproses",
                                                color: Colors.white,
                                                size: sizeMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: UnconstrainedBox(
                                            child: FittedBox(
                                              child: CustomText(
                                                "Al-Quran Selesai",
                                                color: Colors.white,
                                                size: sizeMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: UnconstrainedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: FittedBox(
                                                child: CustomText(
                                                  "${headerData?.onproses ?? 0}",
                                                  color: Colors.white,
                                                  size: sizeBig + sizeMedium,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: UnconstrainedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: FittedBox(
                                                child: CustomText(
                                                  "${headerData?.selesai ?? 0}",
                                                  color: Colors.white,
                                                  size: sizeBig + sizeMedium,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Flexible(
                                  //       child: Padding(
                                  //         padding: EdgeInsets.all(sizeMedium),
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //           children: [
                                  //             const FittedBox(
                                  //                 child: ),
                                  //             FittedBox(
                                  //                 child: ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Flexible(
                                  //       child: Padding(
                                  //         padding: EdgeInsets.all(sizeMedium),
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //           children: [
                                  //             const FittedBox(
                                  //                 child: ),
                                  //             FittedBox(
                                  //                 child: ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
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
                                    const SizedBox(
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
                                    itemCount: state
                                        .bulkScanResponse.detail?.data?.length,
                                    itemBuilder: (cont, ind) {
                                      return Container(
                                        color: ind % 2 == 0
                                            ? null
                                            : primaryDarkerColor,
                                        child: ListTile(
                                            title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 3,
                                                child: FittedBox(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: sizeNormal),
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
                                                            color:
                                                                Colors.white),
                                                        CustomText(
                                                          "Nama Barang (Project): ${dataPerPage?[ind].nmProject}",
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: FittedBox(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: sizeNormal),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // FIXME tanyakan soal field yang benar
                                                        CustomText(
                                                            "QTY: ${dataPerPage?[ind].jmlKeluar}",
                                                            color:
                                                                Colors.white),
                                                        CustomText(
                                                            "Jumlah: ${dataPerPage?[ind].jmlKeluar}",
                                                            color:
                                                                Colors.white),
                                                        CustomText(
                                                            "Satuan: ${dataPerPage?[ind].jmlKeluar}",
                                                            color:
                                                                Colors.white),
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
                                      padding: const EdgeInsets.all(sizeMedium),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyPaginator(
                                            pageLength: ((details?.total ??
                                                        1) ~/
                                                    (details?.perPage ?? 1)) +
                                                1,
                                            onPageChanged: (index) {
                                              // myToast(index.toString());
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
                            Builder(
                              builder: (context) {
                                var state =
                                    context.watch<BulkScanScreenCubit>().state;
                                var text =
                                    "${state.sendScanDataModel.latitude ?? "?"}, ${state.sendScanDataModel.longtitude ?? "?"}";
                                print("latlong in bulk scan screen: $text");
                                return Visibility(
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
                                      Visibility(
                                        visible: false,
                                        child: RoundedContainer(sizeNormal,
                                            boxDecoration: BoxDecoration(
                                                border: Border.all(
                                                    color: primaryGreen)),
                                            child: NoUnderlineTextFormField(
                                              controller: TextEditingController(
                                                  text: text),
                                              enabled: false,
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Visibility(
                              visible: widget.firstTimeScan,
                              child: BlocConsumer<AuthBloc, AuthState>(
                                listener: (c, state) {
                                  myToast("State Auth: ${state.runtimeType}");
                                  print("State Auth: ${state.runtimeType}");
                                  if (state is AuthSuccess) {
                                    var a =
                                        state.loginResponse.user?.role ?? "";
                                    myToast("User Role: $a");
                                    print("User Role: $a");
                                  }
                                },
                                builder: (context, state) {
                                  if (state is AuthSuccess) {
                                    return Padding(
                                      padding: const EdgeInsets.all(sizeMedium),
                                      child: MyDropdownButton<String>(
                                        const ["Terkirim", "Diterima"],
                                        (v) => v,
                                        onItemTapped: (val) {
                                          context
                                              .read<BulkScanScreenCubit>()
                                              .updateModelState((dataModel) {
                                            return dataModel.copyWith(
                                                statusPengiriman: val);
                                          });
                                        },
                                        value: state.loginResponse.user?.role ==
                                                "Petugas"
                                            ? "Terkirim"
                                            : "Diterima",
                                        isEnabled: false,
                                        hint: const Text(
                                          "Status Pengiriman",
                                          style: TextStyle(color: primaryGreen),
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if(state is AuthSuccess){
      return Visibility(
        visible: state
            .loginResponse
            .user
            ?.role ==
            "Petugas" && widget.firstTimeScan,
        child: MyTextField(
          label: 'Keterangan',
          controller: keteranganCtrl,
          onChanged: (val) {
            context
                .read<BulkScanScreenCubit>()
                .updateModelState((dataModel) {
              return dataModel.copyWith(keterangan: val);
            });
          },
        ),
      );
    } return Container();

  },
),
                            Visibility(
                              visible: widget.firstTimeScan,
                              child: MyImagePickerWidget(
                                functionCallbackSetImageFilePath:
                                    (numb, theImage) async {
                                  context
                                      .read<BulkScanScreenCubit>()
                                      .setFotoPath(theImage?.path ?? "");
                                },
                                defaultImagePlaceholder: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(sizeBig),
                                    child: RoundedContainer(
                                      sizeNormal,
                                      height: widthScreen(context) * 0.4,
                                      width: widthScreen(context) * 0.4,
                                      boxDecoration: const BoxDecoration(
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
                            ),

                            Visibility(
                              visible: widget.firstTimeScan,
                              child: BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  if(state is AuthSuccess){
                                    return ElevatedButton(
                                        onPressed: () {
                                          var model = context
                                              .read<BulkScanScreenCubit>()
                                              .state
                                              .sendScanDataModel
                                              .copyWith(
                                              statusPengiriman: state
                                                  .loginResponse
                                                  .user
                                                  ?.role ==
                                                  "Petugas"
                                                  ? "Terkirim"
                                                  : "Diterima",
                                          );
                                          context
                                              .read<QRScanBloc>()
                                              .add(SendScanEvent(model,int.parse(data?.total ?? "0")));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor),
                                        child: const Text("Simpan"));

                                  }
                                  return Container();
                                },
                              ),
                            ),
                            // TODO pindahkan ke halaman scan dus
                            Visibility(
                              visible: false,
                              child: Column(
                                children: [
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
                                              backgroundColor: primaryColor),
                                          child: const Text("History")),
                                      Builder(builder: (context) {
                                        return ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor),
                                            child: const Text("Simpan"));
                                      }),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if(state is AuthSuccess){
      return Visibility(
        visible: state
            .loginResponse
            .user
            ?.role !=
            "Petugas" && !widget.firstTimeScan,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context.router.push(SingleScanRoute(
                    qrcodeSj: data?.qrcodeSj ?? "-"));
              },
              child: RoundedContainer(
                sizeMedium,
                padding: const EdgeInsets.all(sizeBig),
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
              "Scan Dus",
              textAlign: TextAlign.center,
              color: primaryColor,
            )
          ]..map((e) => FittedBox(
            child: e,
          )),
        ),
      );

    }
    return Container();
  },
)
                          ],
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
