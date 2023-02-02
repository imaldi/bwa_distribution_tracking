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
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../core/resources/helper/number_formatter.dart';
import '../../data/models/qr_scan/bulk_q_r_scan_model.dart';
import '../state_management/blocs/auth/auth_bloc.dart';
import '../widgets/custom_bottom_navbar/custom_bottom_navbar.dart';
import '../widgets/my_text_field/my_text_field.dart';

class BulkScanScreen extends StatefulWidget implements AutoRouteWrapper {
  final QRScanBloc qrScanBloc;
  final String qrCode;
  final bool firstTimeScan;
  final bool willScanDus;

  const BulkScanScreen(
      {required this.qrScanBloc,
      this.firstTimeScan = true,
      this.willScanDus = false,
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
      body: BlocConsumer<QRScanBloc, QRScanState>(
        listener: (context, state) {
          if (state is QRBulkScanSuccess) {
            context.read<BulkScanScreenCubit>().updateModelState((model) =>
                model.copyWith(nosj: state.bulkScanResponse.data?.first.nosj));
          }

          if (state is SendScanSuccess) {
            myToast("Send Scan Success");
            // context.router.pop();
            // model = state.bulkScanResponse.data?.first;

            if (model?.qrcodeSj != null) {
              context.router.replace(
                  DetailPengirimanRoute(qrCode: model?.qrcodeSj ?? "null"));
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
            return Container(
              child: const Center(
                child: CircularProgressIndicator(
                  color: primaryGreen,
                ),
              ),
            );
          }
          if (state is QRBulkScanSuccess) {
            // response = state.bulkScanResponse;
            var headerDataList = state.bulkScanResponse.header;
            var headerData = const SuratJalanModel();
            if (headerDataList != null && (headerDataList.length ?? 0) > 0) {
              headerData = headerDataList[0];
            }
            var data = state.bulkScanResponse.data?.first;
            model = state.bulkScanResponse.data?.first;
            var details = state.bulkScanResponse.detail;
            var dataPerPage = details?.data;
            var textColor = primaryColor;
            return SafeArea(
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: sizeMedium,
                                        bottom: sizeMedium,
                                        right: sizeMedium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const FittedBox(
                                            child: CustomText(
                                          "Total Al-Quran Keseluruhan",
                                          color: Colors.white,
                                          size: sizeMedium,
                                        )),
                                        FittedBox(
                                            child: CustomText(
                                          indonesianNumberFormat(
                                              data?.total ?? ""),
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
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            child: CustomText(
                                              "Al-Quran\nBelum Distribusi",
                                              color: Colors.white,
                                              size: sizeMedium,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            child: CustomText(
                                              "Al-Quran\nSudah Distribusi",
                                              color: Colors.white,
                                              size: sizeMedium,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: FittedBox(
                                              child: CustomText(
                                                // fixme kalau angkanya besar jadi overflow
                                                indonesianNumberFormat(
                                                    headerData.onproses ?? headerData.total),
                                                color: Colors.white,
                                                size: sizeBig + sizeMedium,
                                                weight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: FittedBox(
                                              child: CustomText(
                                                indonesianNumberFormat(
                                                    headerData.selesai),
                                                color: Colors.white,
                                                size: sizeBig + sizeMedium,
                                                weight: FontWeight.bold,
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
                                      "KODE PAKET",
                                      color: primaryGreen,
                                      weight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      "${data?.qrcodeSj}",
                                      color: primaryGreen,
                                      size: sizeBig,
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
                                          ": ${DateFormat("dd MMM yyyy", 'id').format(DateFormat("yyyy-MM-dd").parse(data?.tanggal ?? "1998-12-23"))}",
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
                                          ": ${data?.nmPengemudi}",
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: CustomText(
                                          "Kode Project",
                                          color: textColor,
                                        )),
                                        Expanded(
                                            child: CustomText(
                                          ": ${data?.kdProject}",
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
                                          "Nama Project",
                                          color: textColor,
                                        )),
                                        Expanded(
                                            child: CustomText(
                                          ": ${data?.nmProject}",
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
                                                          "Jenis Qur'an  (Project): ${dataPerPage?[ind].nmProject}",
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
                                            "TOTAL AL-QURAN DAN BERAT",
                                            color: Colors.white,
                                            weight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            size: sizeMedium,
                                          ),
                                          CustomText(
                                            "Berat: ${data?.kg} KG",
                                            color: Colors.white,
                                          ),
                                          CustomText(
                                            "TOTAL AL-QURAN: ${data?.total}",
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
                                    return Visibility(
                                      visible: widget.firstTimeScan && !(state.loginResponse.user?.role ==
                                          "Kurir" &&
                                          widget.willScanDus),
                                      child: Column(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              var state =
                                                  context.watch<BulkScanScreenCubit>().state;
                                              var lat = double.parse(state.sendScanDataModel.latitude ?? "0.0");
                                              var lng = double.parse(state.sendScanDataModel.longtitude ?? "0.0");
                                              print("Lat Long: $lat | $lng");

                                              return Column(
                                                children: [
                                                  lat != 0.0 && lng != 0.0 ?
                                                  RoundedContainer(
                                                      sizeMedium,
                                                      boxDecoration:
                                                      const BoxDecoration(
                                                        color: Colors
                                                            .white,
                                                      ),
                                                      constraints:
                                                      const BoxConstraints(
                                                          maxHeight:
                                                          300),
                                                      child:
                                                      FlutterMap(
                                                        options:
                                                        MapOptions(
                                                          center: LatLng(
                                                              lat,
                                                              lng),
                                                          zoom:
                                                          17.0,
                                                          maxZoom:
                                                          18.0,
                                                        ),
                                                        children: [
                                                          TileLayer(
                                                            urlTemplate:
                                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                            userAgentPackageName:
                                                            'com.aim2u.app',
                                                          ),
                                                          MarkerLayer(
                                                              markers: [
                                                                Marker(
                                                                  width: 80,
                                                                  height: 80,
                                                                  rotate: true,
                                                                  point: LatLng(
                                                                      lat,
                                                                      lng),
                                                                  builder: (
                                                                      ctx) =>
                                                                  const Icon(
                                                                    Icons
                                                                        .location_on_rounded,
                                                                    color: primaryGreen,
                                                                    size: sizeHuge,
                                                                  ),
                                                                  // FlutterLogo(
                                                                  //   textColor: Colors.blue,
                                                                  //   key: ObjectKey(Colors.blue),
                                                                  // ),
                                                                )
                                                              ]),
                                                        ],
                                                      )
                                                  ):
                                                  Container(
                                                    margin: const EdgeInsets.symmetric(vertical: sizeHuge),
                                                    child: Center(child: SizedBox(
                                                        width: sizeBig,
                                                        height: sizeBig,
                                                        child: CircularProgressIndicator(color: primaryColor,))),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: sizeNormal),
                                                    child: CustomText("${state.sendScanDataModel.alamat ?? "Loading..."}",color: primaryColor,),
                                                  ),

                                                ],
                                              );
                                            }
                                          ),

                                          Padding(
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
                                          ),
                                          MyTextField(
                                            label: 'Keterangan',
                                            controller: keteranganCtrl,
                                            onChanged: (val) {
                                              context
                                                  .read<BulkScanScreenCubit>()
                                                  .updateModelState((dataModel) {
                                                return dataModel.copyWith(
                                                    keterangan: val);
                                              });
                                            },
                                          ),
                                          MyImagePickerWidget(
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
                                          ElevatedButton(
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
                                                context.read<QRScanBloc>().add(
                                                    SendScanEvent(
                                                        model,
                                                        int.parse(
                                                            data?.total ?? "0")));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: primaryColor),
                                              child: const Text("Simpan")),
                                        ],
                                      ),
                                    );
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
                                if (state is AuthSuccess) {
                                  return Visibility(
                                    visible: state.loginResponse.user?.role ==
                                            "Kurir" &&
                                        widget.willScanDus,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.router.push(SingleScanRoute(
                                                qrcodeSj:
                                                    data?.qrcodeSj ?? "-"));
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
                      ),
                      SizedBox(height: sizeHuge,)
                    ],
                  ),
                ),
              ),
            );
          }

          return Center(child: Text("State is ${state.runtimeType}"),);
        },
      ),
      bottomNavigationBar: const CustomBottomNavbar(activeIndex: 2,),
    );
  }
}
