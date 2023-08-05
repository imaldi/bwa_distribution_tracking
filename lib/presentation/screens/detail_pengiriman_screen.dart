import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_q_r_scan_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_list_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_model.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/custom_appbar_container/custom_appbar_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:timelines/timelines.dart';
import '../../core/resources/consts/sizes.dart';
import '../../core/resources/consts/urls.dart';
import '../../core/resources/helper/number_formatter.dart';
import '../../data/models/qr_scan/bulk_scan_response.dart';
import '../../injection_container.dart';
import '../state_management/blocs/history_scan/history_scan_bloc.dart';
import '../state_management/cubits/detail_riwayat/detail_riwayat_cubit.dart';
import '../widgets/check_logo_widget/check_logo_widget.dart';
import '../widgets/container/rounded_container.dart';
import '../widgets/custom_bottom_navbar/custom_bottom_navbar.dart';
import '../../data/models/qr_scan/dus_detail_response.dart';
import '../widgets/my_vertical_divider/my_vertical_divider.dart';

class DetailPengirimanScreen extends StatefulWidget
    implements AutoRouteWrapper {
  final String qrCode;

  const DetailPengirimanScreen({required this.qrCode, Key? key})
      : super(key: key);

  @override
  State<DetailPengirimanScreen> createState() => _DetailPengirimanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => sl<HistoryScanBloc>()),
    ], child: this);
  }
}

class _DetailPengirimanScreenState extends State<DetailPengirimanScreen> {
  var textColor = Colors.white;
  var controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HistoryScanBloc>().add(GetHistoryPerIdEvent(widget.qrCode));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<HistoryScanBloc, HistoryScanState>(
            listener: (context, state) {
              if (state is HistoryPerIdNotFound) {
                myToast("Data Surat Jalan Tidak Ditemukan");
                context.router.pop();
              }
            },
            builder: (context, state) {
              if (state is HistoryPerIdLoaded) {
                BulkScanResponse response = state.historyPerIdResponse;
                var header =
                (response.header != null && response.header!.isNotEmpty)
                    ? response.header?.first
                    : const SuratJalanModel();
                var data = (response.data != null && response.data!.isNotEmpty)
                    ? response.data?.first
                    : const BulkQRScanModel();
                var nosjhistoryStatusPengirimanList = (response.nosjhistory ?? [])
                    .map((e) => e.statusPengiriman ?? "")
                    .toList();
                var nosjHistory =
                    response.nosjhistory ?? <SendScanDataModel>[].toList();
                var dusHistory = response.dushistory ??
                    [
                      // DusData(nosj: "ASJKNA"),
                      // DusData(nosj: "aABJBN"),
                    ].toList();
                var listAll = []
                  ..toList()
                  ..addAll(dusHistory)..addAll(nosjHistory);
                log("list all: ${listAll}");
                log("list dus: ${dusHistory}");
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: sizeMedium),
                    child: Column(
                      children: [
                        CustomAppbarContainer(
                            titleText: "Detail Pengiriman",
                            child: Column(
                              children: [
                                CustomText(
                                  "${data?.qrcodeSj}", color: Colors.white,
                                  size: sizeBig,),
                                Center(
                                  child: RoundedContainer(sizeMedium,
                                      padding: const EdgeInsets.all(sizeMedium),
                                      margin:
                                      const EdgeInsets.symmetric(
                                          vertical: sizeBig),
                                      boxDecoration: const BoxDecoration(
                                          color: Colors.transparent),
                                      child: Column(
                                        children: [
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
                                                    // Fixme fix with date formatting helper
                                                    ": ${DateFormat(
                                                        "dd MMM yyyy", 'id')
                                                        .format(data?.createdAt ??
                                                        DateTime(2000))}",
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
                                ),
                              ],
                            )),
                        Row(children: [Expanded(child: RoundedContainer(sizeMedium,
                          margin: const EdgeInsets.all(sizeMedium),
                          boxDecoration: const BoxDecoration(color: customLightGreen),
                          child: Container(
                            // height: 100,
                            constraints: const BoxConstraints(
                              minHeight: 120,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: sizeNormal),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/book_icon.svg"),
                                    const Padding(
                                      padding: EdgeInsets.all(sizeNormal),
                                      child: FittedBox(child: CustomText("Total Al-Quran\nKeseluruhan",textAlign: TextAlign.center,color: primaryGreen,size: 3*sizeSmall,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: sizeNormal),
                                      child: FittedBox(child: CustomText("${indonesianNumberFormat(
                                          data?.total ?? "")} Pcs",textAlign: TextAlign.center,color: primaryGreen,weight: FontWeight.bold,size: sizeMedium+ sizeNormal,)),
                                    ),
                                  ],
                                ),
                              ),
                              const MyVerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/book_icon.svg"),
                                    const Padding(
                                      padding: EdgeInsets.all(sizeNormal),
                                      child: FittedBox(child: CustomText("Total Sisa\nAl-Quran",textAlign: TextAlign.center,color: primaryGreen,size: 3*sizeSmall,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: sizeNormal),
                                      child: FittedBox(child: CustomText("${indonesianNumberFormat(
                                          header?.onproses ??
                                              header?.total ?? "0")} Pcs",textAlign: TextAlign.center,color: primaryGreen,weight: FontWeight.bold,size: sizeMedium+ sizeNormal,)),
                                    ),
                                  ],
                                ),
                              ),
                              const MyVerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/book_icon.svg"),
                                    const Padding(
                                      padding: EdgeInsets.all(sizeNormal),
                                      child: FittedBox(child: CustomText("Total Al-Quran\nTerdistribusi",textAlign: TextAlign.center,color: primaryGreen,size: 3*sizeSmall,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: sizeNormal),
                                      child: FittedBox(child: CustomText("${indonesianNumberFormat(
                                          header?.selesai ?? "0")} Pcs",textAlign: TextAlign.center,color: primaryGreen,weight: FontWeight.bold,size: sizeMedium+ sizeNormal,)),
                                    ),
                                  ],
                                ),
                              ),
                            ],),
                          ),),)],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TimelineTile(
                              mainAxisExtent: widthScreen(context) / 4,
                              crossAxisExtent: 130,
                              direction: Axis.horizontal,
                              oppositeContents: Container(
                                color: Colors.transparent,
                                child: const FittedBox(
                                    child: CustomText(
                                      "hmm",
                                      color: Colors.transparent,
                                    )),
                              ),
                              contents: Container(
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.only(left: sizeNormal),
                                child: const FittedBox(
                                    child: CustomText(
                                      'Wakaf Logistik',
                                      color: primaryColor,
                                    )),
                              ),
                              node: TimelineNode(
                                // direction: Axis.horizontal,
                                indicator: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: sizeBig, // Image radius
                                          backgroundColor: Colors.grey,
                                          backgroundImage: nosjhistoryStatusPengirimanList
                                              .isNotEmpty &&
                                              nosjhistoryStatusPengirimanList
                                                  .contains("Terkirim")
                                              ? const AssetImage(
                                              "assets/images/background_main.png")
                                              : null,
                                        ),
                                        SizedBox(
                                          height: sizeMedium + sizeNormal,
                                          width: sizeMedium + sizeNormal,
                                          child: Container(
                                            child: Image.asset(
                                                "assets/images/home_icon_timeline.png"),
                                          ),
                                        )
                                        // Icon(
                                        //   Icons.home,
                                        //   color: Colors.white,
                                        // )
                                      ],
                                    ),
                                    const CheckLogoWidget(),
                                  ],
                                ),
                                // startConnector: SolidLineConnector(),
                                endConnector: const SolidLineConnector(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            TimelineTile(
                              mainAxisExtent: widthScreen(context) / 4,
                              crossAxisExtent: 130,
                              direction: Axis.horizontal,
                              oppositeContents: Container(
                                color: Colors.transparent,
                                child: const FittedBox(
                                    child: CustomText(
                                      "hmm",
                                      color: Colors.transparent,
                                    )),
                              ),
                              contents: Container(
                                height: 100,
                                width: 100,
                                // padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: CustomText(
                                      'Dropping',
                                      color:
                                      nosjhistoryStatusPengirimanList
                                          .isNotEmpty &&
                                          nosjhistoryStatusPengirimanList
                                              .contains("Diterima")
                                          ? primaryColor
                                          : Colors.grey,
                                    )),
                              ),
                              node: TimelineNode(
                                // direction: Axis.horizontal,
                                indicator: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: sizeBig, // Image radius
                                          backgroundColor: Colors.grey,
                                          backgroundImage: nosjhistoryStatusPengirimanList
                                              .isNotEmpty &&
                                              nosjhistoryStatusPengirimanList
                                                  .contains("Diterima")
                                              ? const AssetImage(
                                              "assets/images/background_main.png")
                                              : null,
                                        ),
                                        SizedBox(
                                          height: sizeMedium + sizeNormal,
                                          width: sizeMedium + sizeNormal,
                                          child: Container(
                                            child: Image.asset(
                                                "assets/images/dropping_icon_timeline.png"),
                                          ),
                                        )
                                        // Icon(Icons.home,color: Colors.white,)
                                      ],
                                    ),
                                    Visibility(
                                      visible: nosjhistoryStatusPengirimanList
                                          .isNotEmpty &&
                                          nosjhistoryStatusPengirimanList
                                              .contains("Diterima"),
                                      child:
                                      const CheckLogoWidget(),

                                    )
                                  ],
                                ),
                                startConnector: const SolidLineConnector(
                                  color: primaryColor,
                                ),
                                endConnector: const SolidLineConnector(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            TimelineTile(
                              mainAxisExtent: widthScreen(context) / 4,
                              crossAxisExtent: 130,
                              direction: Axis.horizontal,
                              oppositeContents: Container(
                                color: Colors.transparent,
                                child: const FittedBox(
                                    child: CustomText(
                                      "hmm",
                                      color: Colors.transparent,
                                    )),
                              ),
                              contents: Container(
                                height: 100,
                                width: 100,
                                // padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: CustomText(
                                      'Distribusi',
                                      color: dusHistory.isNotEmpty &&
                                          // listAll
                                          //     .contains("Diterima") &&
                                          // listAll
                                          //     .contains("Terkirim") &&
                                          ((int.parse(header?.total ?? "0") !=
                                              int.parse(header?.selesai ??
                                                  "-1")) &&
                                              (int.parse(
                                                  header?.total ?? "0") !=
                                                  int.parse(header?.onproses ??
                                                      "-1"))) ||
                                          (int.parse(header?.total ?? "0") ==
                                              int.parse(header?.selesai ?? "-1"))
                                          ? primaryColor
                                          : Colors.grey,
                                    )),
                              ),
                              node: TimelineNode(
                                // direction: Axis.horizontal,
                                indicator: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                  Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                        radius: sizeBig, // Image radius
                                        backgroundColor: Colors.grey,
                                        backgroundImage: dusHistory
                                            .isNotEmpty &&
                                            ((int.parse(header?.total ??
                                                "0") !=
                                                int.parse(
                                                    header?.selesai ??
                                                        "-1")) &&
                                                (int.parse(header?.total ??
                                                    "0") !=
                                                    int.parse(
                                                        header?.onproses ??
                                                            "-1"))) ||
                                            (int.parse(
                                                header?.total ?? "0") ==
                                                int.parse(
                                                    header?.selesai ?? "-1"))
                                            ? const AssetImage(
                                            "assets/images/background_main.png")
                                            : null),
                                    SizedBox(
                                      height: sizeMedium + sizeNormal,
                                      width: sizeMedium + sizeNormal,
                                      child: Container(
                                        child: Image.asset(
                                            "assets/images/delivery_icon_timeline.png"),
                                      ),
                                    )
                                  ],
                                ),
                                Visibility(
                                  visible: dusHistory.isNotEmpty &&
                                      ((int.parse(header?.total ??
                                          "0") !=
                                          int.parse(
                                              header?.selesai ??
                                                  "-1")) &&
                                          (int.parse(header?.total ??
                                              "0") !=
                                              int.parse(
                                                  header?.onproses ??
                                                      "-1"))) ||
                                      (int.parse(header?.total ?? "0") ==
                                          int.parse(
                                              header?.selesai ?? "-1")),
                                  child:
                                  const CheckLogoWidget(),),

                                  ],
                                ),
                                startConnector: const SolidLineConnector(
                                  color: primaryColor,
                                ),
                                endConnector: const SolidLineConnector(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            TimelineTile(
                              mainAxisExtent: widthScreen(context) / 4,
                              crossAxisExtent: 130,
                              direction: Axis.horizontal,
                              oppositeContents: Container(
                                color: Colors.transparent,
                                child: const FittedBox(
                                    child: CustomText(
                                      "hmm",
                                      color: Colors.transparent,
                                    )),
                              ),
                              contents: Container(
                                height: 100,
                                width: 100,
                                // padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: CustomText(
                                      'Selesai',
                                      color: dusHistory.isNotEmpty &&
                                          // listAll
                                          //     .contains("Diterima") &&
                                          // listAll
                                          //     .contains("Terkirim") &&
                                          (int.parse(header?.total ?? "0") ==
                                              int.parse(header?.selesai ?? "-1"))
                                          ? primaryColor
                                          : Colors.grey,
                                    )),
                              ),
                              node: TimelineNode(
                                // direction: Axis.horizontal,
                                indicator: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: sizeBig, // Image radius
                                          backgroundColor: Colors.grey,
                                          backgroundImage: listAll.isNotEmpty &&
                                              (int.parse(header?.total ?? "0") ==
                                                  int.parse(
                                                      header?.selesai ?? "-1"))
                                              ? const AssetImage(
                                              "assets/images/background_main.png")
                                              : null,
                                        ),
                                        SizedBox(
                                          height: sizeMedium + sizeNormal,
                                          width: sizeMedium + sizeNormal,
                                          child: Container(
                                            child: Image.asset(
                                                "assets/images/received_icon_timeline.png"),
                                          ),
                                        )
                                      ],
                                    ),
                                    Visibility(
                                      visible: listAll.isNotEmpty &&
                                          (int.parse(header?.total ?? "0") ==
                                              int.parse(
                                                  header?.selesai ?? "-1")),
                                      child: const CheckLogoWidget(),
                                    )
                                  ],
                                ),
                                startConnector: const SolidLineConnector(
                                  color: primaryColor,
                                ),
                                // endConnector: SolidLineConnector(),
                              ),
                            ),
                          ],
                        ),
                        Builder(builder: (c) {
                          return Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: sizeMedium),
                              height: 400,
                              child: NotificationListener<OverscrollNotification>(
                                onNotification: (OverscrollNotification value) {
                                  if (value.overscroll < 0 &&
                                      controller.offset + value.overscroll <= 0) {
                                    if (controller.offset != 0)
                                      controller.jumpTo(0);
                                    return true;
                                  }
                                  if (controller.offset + value.overscroll >=
                                      controller.position.maxScrollExtent) {
                                    if (controller.offset !=
                                        controller.position.maxScrollExtent) {
                                      controller.jumpTo(
                                          controller.position.maxScrollExtent);
                                    }
                                    return true;
                                  }
                                  controller
                                      .jumpTo(
                                      controller.offset + value.overscroll);
                                  return true;
                                },
                                child: ListView.builder(
                                  // itemCount: nosjHistory.length,
                                    itemCount: listAll.length,
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (c, i) {
                                      return TimelineTile(
                                        nodeAlign: TimelineNodeAlign.basic,
                                        nodePosition: 0.3,
                                        oppositeContents: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                listAll[i] is SendScanDataModel
                                                    ? DateFormat(
                                                    "dd MMM yyyy", 'id')
                                                    .format((listAll[i]
                                                as SendScanDataModel)
                                                    .createdAt ??
                                                    DateTime(2022))
                                                    : DateFormat(
                                                    "dd MMM yyyy", 'id')
                                                    .format(
                                                    (listAll[i] as DusData)
                                                        .createdAt ??
                                                        DateTime(2022)),
                                                color: Colors.grey,
                                              ),
                                              CustomText(
                                                listAll[i] is SendScanDataModel
                                                    ? DateFormat("HH:mm", 'id')
                                                    .format((listAll[i]
                                                as SendScanDataModel)
                                                    .createdAt ??
                                                    DateTime(2022))
                                                    : DateFormat("HH:mm", 'id')
                                                    .format(
                                                    (listAll[i] as DusData)
                                                        .createdAt ??
                                                        DateTime(2022)),
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                        contents: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            margin:
                                            const EdgeInsets.only(
                                                left: sizeSmall,
                                                right:
                                                sizeNormal),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: hintTextColor),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(sizeNormal)),
                                            ),
                                            constraints:
                                            const BoxConstraints(maxWidth: 400),
                                            child: ListTile(
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: sizeNormal,
                                                  right: sizeNormal),
                                              title: Container(
                                                child: CustomText(
                                                  "${listAll[i] is SendScanDataModel
                                                      ? (listAll[i] as SendScanDataModel)
                                                      .statusPengiriman
                                                      : "Distribusi - Lokasi ${(listAll
                                                      .length - 1) -
                                                      (dusHistory.indexOf(
                                                          listAll[i]) + 1)}"
                                                  // "Selesai"

                                                  }",
                                                  weight: FontWeight.bold,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    "${listAll[i] is SendScanDataModel
                                                        ? (listAll[i] as SendScanDataModel)
                                                        .keterangan
                                                        : "Penerima: ${(listAll[i] as DusData)
                                                        .namaPenerima ??
                                                        "No Receiver"} \nTempat: ${(listAll[i] as DusData)
                                                        .nmTempat ??
                                                        "No Address"}"}",
                                                    color: primaryColor,
                                                  ),
                                                  CustomText(
                                                    "Dibuat oleh: ${listAll[i]
                                                        .createdBy}",
                                                    color: primaryColor,
                                                    italic: true,),
                                                  const SizedBox(
                                                    height: sizeNormal,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await showDialog(
                                                          context: context,
                                                          builder: (c) {
                                                            // var _rotation =
                                                            //     _mapController
                                                            //         .rotation;
                                                            return BlocProvider(
                                                              create: (context) =>
                                                                  sl<
                                                                      DetailRiwayatCubit>(),
                                                              child: BlocBuilder<
                                                                  DetailRiwayatCubit,
                                                                  DetailRiwayatState>(
                                                                builder: (context,
                                                                    state) {
                                                                  var stateDetailDus = state
                                                                      .dusDetailResponse;
                                                                  var listHeaderDus = stateDetailDus
                                                                      ?.dushead ??
                                                                      <Dushead>[];
                                                                  var listDetailDus = stateDetailDus
                                                                      ?.dusdetail ??
                                                                      <Dusdetail>[
                                                                      ];
                                                                  var lat = 0.0;
                                                                  var lng = 0.0;
                                                                  if (listAll[i] is SendScanDataModel) {
                                                                    lat = double
                                                                        .parse(
                                                                        (listAll[i] as SendScanDataModel)
                                                                            .latitude ??
                                                                            "0.0");
                                                                    lng = double
                                                                        .parse(
                                                                        (listAll[i] as SendScanDataModel)
                                                                            .longtitude ??
                                                                            "0.0");
                                                                  } else {
                                                                    lat = double
                                                                        .parse(
                                                                        (listAll[i] as DusData)
                                                                            .latitude ??
                                                                            "0.0");
                                                                    lng = double
                                                                        .parse(
                                                                        (listAll[i] as DusData)
                                                                            .longtitude ??
                                                                            "0.0");
                                                                  }
                                                                  return RoundedContainer(
                                                                    sizeMedium,
                                                                    initState: listAll[i] is SendScanDataModel
                                                                        ? null
                                                                        : () {
                                                                      context
                                                                          .read<
                                                                          DetailRiwayatCubit>()
                                                                          .getDusDetailResponse(
                                                                          listAll[i] is DusData
                                                                              ? "${(listAll[i] as DusData)
                                                                              .locationId}"
                                                                              : widget
                                                                              .qrCode);
                                                                    },
                                                                    margin: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                        sizeMedium,
                                                                        vertical:
                                                                        sizeHuge),
                                                                    child:
                                                                    listAll[i] is SendScanDataModel
                                                                        ?
                                                                    Builder(
                                                                        builder: (
                                                                            context) {
                                                                          var noSJHistory = (listAll[i] as SendScanDataModel);
                                                                          return SingleChildScrollView(
                                                                            child:
                                                                            Column(
                                                                              children: [
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
                                                                                          'com.example.app',
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
                                                                                ),

                                                                                Text(
                                                                                    "Detail Alamat:\n${noSJHistory
                                                                                        .alamat}"),
                                                                                RoundedContainer(
                                                                                    sizeNormal,
                                                                                    boxDecoration: BoxDecoration(
                                                                                        border: Border
                                                                                            .all(
                                                                                            color: primaryGreen)),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Table(
                                                                                          children: [
                                                                                            TableRow(
                                                                                              children: [
                                                                                                const Text(
                                                                                                    "No SJ"),
                                                                                                Text(
                                                                                                    ": ${noSJHistory
                                                                                                        .nosj
                                                                                                        ??
                                                                                                        "-"}"),
                                                                                              ],
                                                                                            ),
                                                                                            TableRow(
                                                                                              children: [
                                                                                                const Text(
                                                                                                    "Kota"),
                                                                                                Text(
                                                                                                    ": ${noSJHistory
                                                                                                        .kota
                                                                                                        ??
                                                                                                        "-"}"),
                                                                                              ],
                                                                                            ),
                                                                                            TableRow(
                                                                                              children: [
                                                                                                const Text(
                                                                                                    "Keterangan"),
                                                                                                Text(
                                                                                                    ": ${noSJHistory
                                                                                                        .keterangan ??
                                                                                                        "-"}"),
                                                                                              ],
                                                                                            ),
                                                                                            TableRow(
                                                                                              children: [
                                                                                                const Text(
                                                                                                    "Status Pengiriman"),
                                                                                                Text(
                                                                                                    ": ${noSJHistory
                                                                                                        .statusPengiriman
                                                                                                        ??
                                                                                                        "-"}"),
                                                                                              ],
                                                                                            ),
                                                                                            TableRow(
                                                                                              children: [
                                                                                                const Text(
                                                                                                    "Created By"),
                                                                                                Text(
                                                                                                    ": ${noSJHistory
                                                                                                        .createdBy
                                                                                                        ??
                                                                                                        "-"}"),
                                                                                              ],
                                                                                            ),
                                                                                            TableRow(
                                                                                              children: [
                                                                                                const Text(
                                                                                                    "Created At"),
                                                                                                Text(
                                                                                                    ": ${noSJHistory
                                                                                                        .createdAt
                                                                                                        ??
                                                                                                        "-"}"),
                                                                                              ],
                                                                                            ),
                                                                                          ],),
                                                                                        Material(
                                                                                          child: ExpandablePanel(
                                                                                            header: const Text(
                                                                                                "Foto"),
                                                                                            collapsed: Container(),
                                                                                            expanded: Image
                                                                                                .network(
                                                                                              "$imageResourceUrl${noSJHistory
                                                                                                  .foto ??
                                                                                                  "-"}",
                                                                                              errorBuilder: (
                                                                                                  c,
                                                                                                  o,
                                                                                                  s) {
                                                                                                return const Center(
                                                                                                    child: Text(
                                                                                                        "Image Not Found"));
                                                                                              },),
                                                                                            // tapHeaderToExpand: true,
                                                                                            // hasIcon: true,
                                                                                          ),
                                                                                        ),


                                                                                      ],
                                                                                    )
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }
                                                                    )
                                                                        :
                                                                    SingleChildScrollView(
                                                                      child: Column(
                                                                        children: [
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
                                                                                  // onPositionChanged:
                                                                                  //     (mapPosition,
                                                                                  //         _) {
                                                                                  //   setState(
                                                                                  //       () {
                                                                                  //     _rotation =
                                                                                  //         _mapController.rotation;
                                                                                  //   });
                                                                                  // },
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
                                                                                    'com.example.app',
                                                                                  ),
                                                                                  MarkerLayer(
                                                                                      markers: [
                                                                                        Marker(
                                                                                          width: 80,
                                                                                          height: 80,
                                                                                          rotate: true,
                                                                                          point: LatLng(
                                                                                              (listAll[i] is DusData
                                                                                                  ? double
                                                                                                  .parse(
                                                                                                  (listAll[i] as DusData)
                                                                                                      .latitude ??
                                                                                                      "0.0")
                                                                                                  : (double
                                                                                                  .parse(
                                                                                                  (listAll[i] as SendScanDataModel)
                                                                                                      .latitude ??
                                                                                                      "0.0"))),
                                                                                              (listAll[i] is DusData
                                                                                                  ? double
                                                                                                  .parse(
                                                                                                  (listAll[i] as DusData)
                                                                                                      .longtitude ??
                                                                                                      "0.0")
                                                                                                  : (double
                                                                                                  .parse(
                                                                                                  (listAll[i] as SendScanDataModel)
                                                                                                      .longtitude ??
                                                                                                      "0.0")))),
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
                                                                            // Column(
                                                                            //   children: [
                                                                            //     Text(
                                                                            //         "Disini nanti detail dus dan map"),
                                                                            //     Text('Lat: ${(listAll[i] is DusData ? (listAll[i] as DusData).latitude : (listAll[i] as SendScanDataModel).latitude )}'),
                                                                            //     Text('Long: ${(listAll[i] is DusData ? (listAll[i] as DusData).longtitude : (listAll[i] as SendScanDataModel).longtitude )}'),
                                                                            //   ],
                                                                            // )
                                                                          ),

                                                                          Builder(
                                                                              builder: (
                                                                                  context) {
                                                                                return Text(
                                                                                    "Detail Alamat:\n${ listHeaderDus
                                                                                        .isNotEmpty
                                                                                        ? listHeaderDus
                                                                                        .first
                                                                                        .detailTempat
                                                                                        :
                                                                                    "Loading..."}");
                                                                              }
                                                                          ),
                                                                          // Text(
                                                                          //     ": ${"${listHeaderDus.first
                                                                          //         .nmTempat ?? ""} ${listHeaderDus.first
                                                                          //         .detailTempat ?? ""}"}"),
                                                                          ListView
                                                                              .builder(
                                                                              itemCount: listHeaderDus
                                                                                  .length,
                                                                              physics: const ClampingScrollPhysics(),
                                                                              scrollDirection: Axis
                                                                                  .vertical,
                                                                              shrinkWrap: true,
                                                                              itemBuilder: (
                                                                                  c,
                                                                                  index) {
                                                                                return
                                                                                  RoundedContainer(
                                                                                      sizeNormal,
                                                                                      boxDecoration: BoxDecoration(
                                                                                          border: Border
                                                                                              .all(
                                                                                              color: primaryGreen)),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Table(
                                                                                            children: [
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "No SJ"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .nosj
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "QR Code SJ"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .qrcodeSj
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Nama Penerima"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .namaPenerima ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Nomor HP"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .noHp ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Lembaga"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .lembaga
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Kelurahan"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .kelurahan
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Kecamatan"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .kecamatan
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Kabupaten"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .kabupaten
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Provinsi"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .provinsi
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Dibuat Tanggal"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .createdAt
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                              TableRow(
                                                                                                children: [
                                                                                                  const Text(
                                                                                                      "Dibuat Oleh"),
                                                                                                  Text(
                                                                                                      ": ${listHeaderDus[index]
                                                                                                          .createdBy
                                                                                                          ??
                                                                                                          "-"}"),
                                                                                                ],
                                                                                              ),
                                                                                            ],),
                                                                                          Material(
                                                                                            child: ExpandablePanel(
                                                                                              header: const Text(
                                                                                                  "Foto"),
                                                                                              collapsed: Container(),
                                                                                              expanded: Image
                                                                                                  .network(
                                                                                                "$imageResourceUrl${listHeaderDus[index]
                                                                                                    .foto ??
                                                                                                    "-"}",
                                                                                                errorBuilder: (
                                                                                                    c,
                                                                                                    o,
                                                                                                    s) {
                                                                                                  return const Center(
                                                                                                      child: Text(
                                                                                                          "Image Not Found"));
                                                                                                },),
                                                                                              // tapHeaderToExpand: true,
                                                                                              // hasIcon: true,
                                                                                            ),
                                                                                          ),


                                                                                        ],
                                                                                      )
                                                                                  );
                                                                              }),
                                                                          const SizedBox(
                                                                            height: sizeBig,),
                                                                          ListView
                                                                              .builder(
                                                                              itemCount: listDetailDus
                                                                                  .length,
                                                                              physics: const ClampingScrollPhysics(),
                                                                              scrollDirection: Axis
                                                                                  .vertical,
                                                                              shrinkWrap: true,
                                                                              itemBuilder: (
                                                                                  c,
                                                                                  index) {
                                                                                return
                                                                                  RoundedContainer(
                                                                                      sizeNormal,
                                                                                      boxDecoration: BoxDecoration(
                                                                                          border: Border
                                                                                              .all(
                                                                                              color: primaryGreen)),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Table(
                                                                                              children: [
                                                                                                TableRow(
                                                                                                  children: [
                                                                                                    const Text(
                                                                                                        "No Dus"),
                                                                                                    Text(
                                                                                                        ": ${listDetailDus[index]
                                                                                                            .nodus
                                                                                                            ??
                                                                                                            "-"}"),
                                                                                                  ],
                                                                                                ),
                                                                                                const TableRow(
                                                                                                  children: [
                                                                                                    Text(
                                                                                                        "Quantity"),
                                                                                                    Text(
                                                                                                        ": 20"),
                                                                                                  ],
                                                                                                ),
                                                                                              ]),
                                                                                          Material(
                                                                                            child: ExpandablePanel(
                                                                                                header: const Text(
                                                                                                    "Foto"),
                                                                                                collapsed: Container(),
                                                                                                expanded: Image
                                                                                                    .network(
                                                                                                  "$imageResourceUrl${listDetailDus[index]
                                                                                                      .foto
                                                                                                      ??
                                                                                                      "-"}",
                                                                                                  errorBuilder: (
                                                                                                      c,
                                                                                                      o,
                                                                                                      s) {
                                                                                                    return const Center(
                                                                                                        child: Text(
                                                                                                            "Image Not Found"));
                                                                                                  },)),
                                                                                          )
                                                                                        ],
                                                                                      ));

                                                                                // Text(
                                                                                //   listDetailDus[index]
                                                                                //       .toString());
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    child: const RoundedContainer(
                                                        sizeMedium,
                                                        boxDecoration:
                                                        BoxDecoration(
                                                            color:
                                                            primaryGreen),
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                            sizeSmall),

                                                        child: Center(
                                                            child: CustomText(
                                                                "Lihat Detail",
                                                                color:
                                                                Colors.white))),
                                                  )
                                                ],
                                              ),
                                            )
                                          // Text('contents\ncontents\ncontents\ncontents'),
                                        ),
                                        node: TimelineNode(
                                          indicator: const DotIndicator(
                                            color: primaryColor,
                                          ),
                                          startConnector: i != 0
                                              ? const SolidLineConnector(
                                            color: primaryColor,
                                          )
                                              : null,
                                          endConnector: i != (listAll.length - 1)
                                              ? const SolidLineConnector(
                                            color: primaryColor,
                                          )
                                              : null,
                                        ),
                                      );
                                    }),
                              ));
                        })
                      ],
                    ),
                  ),
                );
              }
              if (state is HistoryScanLoading) {
                return const Center(
                  child: SizedBox(
                    width: sizeBig,
                    height: sizeBig,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
              }
              return const Center(
                child: CustomText(
                  "Maaf, data tidak ditemukan",
                  color: primaryColor,
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomNavbar(activeIndex: 3,),
      ),
    );
  }
}
