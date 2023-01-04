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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import '../../core/resources/consts/sizes.dart';
import '../../data/models/qr_scan/bulk_scan_response.dart';
import '../../injection_container.dart';
import '../state_management/blocs/history_scan/history_scan_bloc.dart';
import '../widgets/container/rounded_container.dart';
import '../widgets/custom_bottom_navbar/custom_bottom_navbar.dart';

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
  final _mapController = MapController();

  @override
  void initState() {
    super.initState();
    context.read<HistoryScanBloc>().add(GetHistoryPerIdEvent(widget.qrCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ..addAll(dusHistory)
                ..addAll(nosjHistory);
              log("list all: ${listAll}");
              log("list dus: ${dusHistory}");
              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    CustomAppbarContainer(
                        titleText: "Detail Pengiriman",
                        child: Center(
                          child: RoundedContainer(sizeMedium,
                              padding: const EdgeInsets.all(sizeMedium),
                              margin:
                                  const EdgeInsets.symmetric(vertical: sizeBig),
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
                                        ": ${DateFormat("dd MMM yyyy", 'id').format(data?.createdAt ?? DateTime(2000))}",
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
                                ],
                              )),
                        )),
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
                                  nosjhistoryStatusPengirimanList.isNotEmpty &&
                                          nosjhistoryStatusPengirimanList
                                              .contains("Diterima")
                                      ? primaryColor
                                      : Colors.grey,
                            )),
                          ),
                          node: TimelineNode(
                            // direction: Axis.horizontal,
                            indicator: Stack(
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
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                    radius: sizeBig, // Image radius
                                    backgroundColor: Colors.grey,
                                    backgroundImage: dusHistory.isNotEmpty &&
                                                // listAll
                                                //     .contains("Diterima") &&
                                                // listAll
                                                //     .contains("Terkirim") &&
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
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: sizeBig, // Image radius
                                  backgroundColor: Colors.grey,
                                  backgroundImage: listAll.isNotEmpty &&
                                          // listAll
                                          //     .contains("Diterima") &&
                                          // listAll
                                          //     .contains("Terkirim") &&
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
                                  .jumpTo(controller.offset + value.overscroll);
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
                                        constraints:
                                            const BoxConstraints(maxWidth: 400),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.only(
                                              left: sizeNormal,
                                              right: sizeNormal),
                                          title: Container(
                                            child: CustomText(
                                              "${listAll[i] is SendScanDataModel ? (listAll[i] as SendScanDataModel).statusPengiriman : "Selesai - Lokasi ${(listAll.length - 1) - (dusHistory.indexOf(listAll[i]) + 1)}"
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
                                                "${listAll[i] is SendScanDataModel ? (listAll[i] as SendScanDataModel).keterangan : "Penerima: ${(listAll[i] as DusData).namaPenerima ?? "No Receiver"} \nTempat: ${(listAll[i] as DusData).nmTempat ?? "No Address"}"}",
                                                color: primaryColor,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await showDialog(
                                                      context: context,
                                                      builder: (c) {
                                                        return RoundedContainer(
                                                            sizeMedium,
                                                            boxDecoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            margin: const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    sizeMedium,
                                                                vertical:
                                                                    sizeHuge),
                                                            child: Text(
                                                                "Disini nanti detail dus dan map"));
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
                                                                sizeNormal),
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
                    }),
                    Container(
                        margin: const EdgeInsets.only(bottom: sizeHuge),
                        // height: 300,
                        // clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Text("Latitude: ${nosjHistory.first.latitude}"),
                            Text("Longitude: ${nosjHistory.first.longtitude}"),
                      // FlutterMap(
                      //   mapController: _mapController,
                      //   options: MapOptions(),
                      //   children: [],
                      //   nonRotatedChildren: [],
                      // )
                      //       FlutterMap(
                      //         options: MapOptions(
                      //           center: LatLng(double.parse(nosjHistory.first.latitude ?? "0.0"), double.parse(nosjHistory.first.longtitude ?? "0.0")),
                      //           zoom: 9.0,
                      //         ),
                      //         nonRotatedChildren: [
                      //           AttributionWidget.defaultWidget(
                      //             source: 'OpenStreetMap contributors',
                      //             onSourceTapped: (){},
                      //           ),
                      //         ],
                      //         children: [
                      //           TileLayer(
                      //             urlTemplate:
                      //                 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      //             userAgentPackageName: 'com.example.app',
                      //           ),
                      //         ],
                      //       )
                          ],
                        ))
                    // RoundedContainer(sizeNormal,
                    //     width: 200,
                    //     height: 200,
                    //     padding: const EdgeInsets.all(0),
                    //     clipBehavior: Clip.antiAlias,
                    //     child: Image.asset(
                    //       "assets/images/photo_example.png",
                    //       fit: BoxFit.cover,
                    //     ))
                  ],
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
      bottomNavigationBar: const CustomBottomNavbar(),
    );
  }
}
