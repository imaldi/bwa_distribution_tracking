import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/custom_appbar_container/custom_appbar_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';
import '../../core/resources/consts/sizes.dart';
import '../../injection_container.dart';
import '../state_management/blocs/history_scan/history_scan_bloc.dart';
import '../widgets/container/rounded_container.dart';

class DetailPengirimanScreen extends StatefulWidget implements AutoRouteWrapper {
  final String qrCode;
  const DetailPengirimanScreen({required this.qrCode, Key? key}) : super(key: key);

  @override
  State<DetailPengirimanScreen> createState() => _DetailPengirimanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<HistoryScanBloc>()),
        ],
        child: this);
  }
}

class _DetailPengirimanScreenState extends State<DetailPengirimanScreen> {
  var textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    context.read<HistoryScanBloc>().add(GetHistoryPerIdEvent(widget.qrCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HistoryScanBloc, HistoryScanState>(
  builder: (context, state) {
    if(state is HistoryPerIdLoaded){
      return SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbarContainer(
                titleText: "Detail Pengiriman",
                child: Center(
                  child: RoundedContainer(sizeMedium,
                      padding: const EdgeInsets.all(sizeMedium),
                      margin: const EdgeInsets.symmetric(vertical: sizeBig),
                      boxDecoration:
                      const BoxDecoration(color: Colors.transparent),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: CustomText(
                                    "Tanggal",
                                    color: textColor,
                                  )),
                              Expanded(
                                  child: CustomText(
                                    ": {data?.tanggal}",
                                    color: textColor,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: CustomText(
                                    "Nomor PC/PO",
                                    color: textColor,
                                  )),
                              Expanded(
                                  child: CustomText(
                                    ": {data?.nopc}",
                                    color: textColor,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: CustomText(
                                    "No Polisi",
                                    color: textColor,
                                  )),
                              Expanded(
                                  child: CustomText(
                                    ": {data?.nopol}",
                                    color: textColor,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: CustomText(
                                    "Nama Ekspedisi",
                                    color: textColor,
                                  )),
                              Expanded(
                                  child: CustomText(
                                    ": {data?.dikirimBy}",
                                    color: textColor,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: CustomText(
                                    "Alamat Pengirimiman",
                                    color: textColor,
                                  )),
                              Expanded(
                                  child: CustomText(
                                    ": {data?.alamat}",
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
                    child: FittedBox(
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
                          backgroundImage:
                          AssetImage("assets/images/background_main.png"),
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
                    endConnector: SolidLineConnector(),
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
                          backgroundImage:
                          AssetImage("assets/images/background_main.png"),
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
                    startConnector: SolidLineConnector(),
                    endConnector: SolidLineConnector(),
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
                          'Pengiriman',
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
                          backgroundImage:
                          AssetImage("assets/images/background_main.png"),
                        ),
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
                    startConnector: SolidLineConnector(),
                    endConnector: SolidLineConnector(),
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
                          'Diterima',
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
                          backgroundImage:
                          AssetImage("assets/images/background_main.png"),
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
                    startConnector: SolidLineConnector(),
                    // endConnector: SolidLineConnector(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: sizeBig),
              child: TimelineTile(
                nodeAlign: TimelineNodeAlign.start,
                oppositeContents: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    'opposite\ncontents',
                    color: Colors.white,
                  ),
                ),
                contents: Container(
                    padding: EdgeInsets.all(8.0),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(left: sizeNormal,right: sizeNormal),
                      title: FittedBox(
                          child: CustomText(
                            "Drop Point 1 (Jam: 12.00 | 05-09-2022)",
                            weight: FontWeight.bold,
                            color: primaryColor,
                          )),
                      subtitle: CustomText("Paket Selesai Di Packing",
                        color: primaryColor,
                      ),
                    )
                  // Text('contents\ncontents\ncontents\ncontents'),
                ),
                node: const TimelineNode(
                  indicator: DotIndicator(color: primaryColor,),
                  endConnector: SolidLineConnector(color: primaryColor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: sizeBig),
              child: TimelineTile(
                nodeAlign: TimelineNodeAlign.start,
                oppositeContents: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: CustomText(
                    'opposite\ncontents',
                    color: Colors.white,
                  ),
                ),
                contents: Container(
                    padding: EdgeInsets.all(8.0),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(left: sizeNormal,right: sizeNormal),
                      title: FittedBox(
                          child: CustomText(
                            "Drop Point 1 (Jam: 12.00 | 05-09-2022)",
                            weight: FontWeight.bold,
                            color: primaryColor,
                          )),
                      subtitle: CustomText("Paket Selesai Di Packing",
                        color: primaryColor,
                      ),
                    )
                  // Text('contents\ncontents\ncontents\ncontents'),
                ),
                node: const TimelineNode(
                  indicator: DotIndicator(color: primaryColor,),
                  startConnector: SolidLineConnector(color: primaryColor,),
                  endConnector: SolidLineConnector(color: primaryColor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: sizeBig),
              child: TimelineTile(
                nodeAlign: TimelineNodeAlign.start,
                oppositeContents: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: CustomText(
                    'opposite\ncontents',
                    color: Colors.white,
                  ),
                ),
                contents: Container(
                    padding: EdgeInsets.all(8.0),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(left: sizeNormal,right: sizeNormal),
                      title: FittedBox(
                          child: CustomText(
                            "Drop Point 1 (Jam: 12.00 | 05-09-2022)",
                            weight: FontWeight.bold,
                            color: primaryColor,
                          )),
                      subtitle: CustomText("Paket Selesai Di Packing",
                        color: primaryColor,
                      ),
                    )
                  // Text('contents\ncontents\ncontents\ncontents'),
                ),
                node: const TimelineNode(
                  indicator: DotIndicator(color: primaryColor,),
                  startConnector: SolidLineConnector(color: primaryColor,),
                  endConnector: SolidLineConnector(color: primaryColor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: sizeBig),
              child: TimelineTile(
                nodeAlign: TimelineNodeAlign.start,
                oppositeContents: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: CustomText(
                    'opposite\ncontents',
                    color: Colors.white,
                  ),
                ),
                contents: Container(
                    padding: EdgeInsets.all(8.0),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(left: sizeNormal,right: sizeNormal),
                      title: FittedBox(
                          child: CustomText(
                            "Drop Point 1 (Jam: 12.00 | 05-09-2022)",
                            weight: FontWeight.bold,
                            color: primaryColor,
                          )),
                      subtitle: CustomText("Paket Selesai Di Packing",
                        color: primaryColor,
                      ),
                    )
                  // Text('contents\ncontents\ncontents\ncontents'),
                ),
                node: const TimelineNode(
                  indicator: DotIndicator(color: primaryColor,),
                  startConnector: SolidLineConnector(color: primaryColor,),
                ),
              ),
            ),

            RoundedContainer(sizeNormal,
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                child: Image.asset("assets/images/photo_example.png",fit: BoxFit.cover,))
          ],
        ),
      );
    }
    if(state is HistoryScanLoading) {
      return const Center(child: SizedBox(width: sizeHuge,height: sizeHuge,child: CircularProgressIndicator(color: primaryColor,),),);
    }
    return const Center(child: CustomText("Maaf, data tidak ditemukan",color: primaryColor,),);
  },
),
      ),
    );
  }
}
