import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/internet_connection/internet_connection_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/surat_jalan/surat_jalan_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_paginator/my_paginator.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text_form_field/no_underline_text_form_field.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

import '../../core/resources/consts/colors.dart';
import '../../core/resources/consts/strings.dart';
import '../../core/resources/helper/number_formatter.dart';
import '../../core/resources/media_query/media_query_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_bottom_navbar/custom_bottom_navbar.dart';
import '../widgets/summary_status_tag_widget/summary_status_tag_widget.dart';

/// menu status for pengiriman
const constPengiriman = "Pengiriman";
const constPenerimaan = "Penerimaan";
const constDistribusi = "Distribusi";
const constLaporan = "Laporan";

// TODO hapus Selamat Datang selain dari halaman home depan
// TODO ubah supaya selamat datang ga muncul selain di awal
// TODO Ketika Cari Arahin nanti ke halaman scan dus, jangan ke halaman riwayat
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(
        value: sl<QRScanBloc>(),
        child: this,
      ),
      BlocProvider(
        create: (_) => sl<SuratJalanCubit>(),
        child: this,
      ),
    ], child: this);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InternetConnectionCubit>().checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // myToast("Heey");
        context.read<SuratJalanCubit>().resetStateViewList();
        return false;
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: BlocConsumer<InternetConnectionCubit, InternetConnectionState>(
            listener: (context, state) {
              if (!state.isOnline) {
                myToast("Internet Disconnected");
              }
              // if (state.isOnline) {
              //   context.read<SuratJalanCubit>().getSuratJalanPerPage(1);
              // }
              // else {
              //   myToast("Internet Reconnected");
              // }
              print("Internet Connected: ${state.isOnline}");
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.read<InternetConnectionCubit>().checkConnection();
                },
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            // color: Colors.blue,
                            // height: orientedHeightScreen(context,
                            //     portraitRatio: 0.75, landscapeRatio: 0.75),
                            // width: orientedWidthScreen(context,
                            //     portraitRatio: 1, landscapeRatio: 1),
                            padding: EdgeInsets.fromLTRB(
                                sizeBig,
                                orientedHeightScreen(context,
                                    portraitRatio: 0.04, landscapeRatio: 0.04),
                                // orientedValueOf<double>(context,
                                //     portraitValue: sizeBig, landscapeValue: sizeMedium),
                                sizeBig,
                                0),
                            decoration: const BoxDecoration(
                              // gradient: basicDiagonalGradient(),
                              color: primaryColor,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/background_main.png"),
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(sizeBig),
                                  bottomRight: Radius.circular(sizeBig)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.end,
                                          //   children: [
                                          //     BlocBuilder<AuthBloc, AuthState>(
                                          //         builder: (bc, authState) {
                                          //       return BlocListener<AuthBloc,
                                          //           AuthState>(
                                          //         listener: (BuildContext context,
                                          //             state) {
                                          //           if (state is AuthLoggedOut) {
                                          //             context.router.replace(
                                          //                 const LoginRoute());
                                          //           }
                                          //         },
                                          //         child: InkWell(
                                          //           onTap: () {
                                          //             bc.read<AuthBloc>().add(
                                          //                 const UserLogoutAuthEvent());
                                          //           },
                                          //           // backgroundColor: primaryBlue,
                                          //           child: Column(
                                          //             crossAxisAlignment:
                                          //                 CrossAxisAlignment
                                          //                     .center,
                                          //             children: const [
                                          //               Icon(
                                          //                 Icons.logout,
                                          //                 color: Colors.white,
                                          //                 size: sizeBig,
                                          //               ),
                                          //               CustomText(
                                          //                 "Logout",
                                          //                 color: Colors.white,
                                          //               )
                                          //             ],
                                          //           ),
                                          //         ),
                                          //       );
                                          //     }),
                                          //   ],
                                          // ),
                                          Builder(builder: (context) {
                                            var appBarTitle = context
                                                    .watch<SuratJalanCubit>()
                                                    .state
                                                    .menuStatusForTitle ??
                                                "-";
                                            print("appBarTitle: $appBarTitle");

                                            return Visibility(
                                              visible: appBarTitle != "-",
                                              child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(child: Builder(
                                                            builder: (context) {
                                                          return CustomText(
                                                            appBarTitle,
                                                            color: Colors.white,
                                                            size: sizeMedium,
                                                          );
                                                        }))
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        context.router.pop();
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .keyboard_arrow_left_outlined,
                                                        color: Colors.white,
                                                        size: sizeBig,
                                                      ),
                                                    ),
                                                  ]),
                                            );
                                          }),

                                          Container(
                                            // color: primaryGreen,
                                            height: orientedHeightScreen(
                                                context,
                                                portraitRatio: 0.20,
                                                landscapeRatio: 0.20),
                                            child: FittedBox(
                                              child: Column(
                                                children: [
                                                  const Center(
                                                    child: FittedBox(
                                                      child: Icon(
                                                        Icons.account_circle,
                                                        size: 100,
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(builder: (context) {
                                                    var isDisplayingWelcome = context
                                                            .watch<
                                                                SuratJalanCubit>()
                                                            .state
                                                            .menuStatusForTitle ??
                                                        "";
                                                    print(
                                                        "isDisplayingWelcome: $isDisplayingWelcome");
                                                    return Visibility(
                                                      visible:
                                                          isDisplayingWelcome
                                                              .isEmpty,
                                                      child: const FittedBox(
                                                        child: CustomText(
                                                          "SELAMAT DATANG PETUGAS",
                                                          color: Colors.white,
                                                          size: sizeBig,
                                                          weight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                  FittedBox(child: BlocBuilder<
                                                      AuthBloc, AuthState>(
                                                    builder: (context, state) {
                                                      return CustomText(
                                                        (state is AuthSuccess)
                                                            ? "${state.loginResponse.user?.name}"
                                                            : "Guest User",
                                                        color: Colors.white,
                                                        size: sizeHuge,
                                                      );
                                                    },
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Image.asset("assets/images/foto_profil_dummy.png"),

                                          InkWell(
                                            onTap: () {
                                              // myToast("HEEYY HEEYY");
                                              context.router
                                                  .push(RiwayatSuratJalanRoute(
                                                qrScanBloc:
                                                    context.read<QRScanBloc>(),
                                                isLacakPerSJ: true,
                                              ));
                                            },
                                            child: Container(
                                              // color: Colors.green,
                                              height: orientedHeightScreen(
                                                  context,
                                                  portraitRatio: 0.15,
                                                  landscapeRatio: 0.15),
                                              padding: const EdgeInsets.all(
                                                  sizeNormal),
                                              child: Column(
                                                children: [
                                                  const CustomText(
                                                    "Masukkan Nomor Surat Jalan",
                                                    color: Colors.white,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: RoundedContainer(
                                                          sizeMedium,
                                                          boxDecoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            border: Border.all(
                                                                width: 3.0,
                                                                color: Colors
                                                                    .white),
                                                            // borderRadius: BorderRadius.all(Radius.circular(sizeBig)),
                                                          ),
                                                          child: const Center(
                                                              child: CustomText(
                                                            "Shipping Code",
                                                            color: Colors.white,
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                        // ..map((e) => Flexible(child: e))
                                        ),
                                  ),
                                ),
                              ],
                            )),
                        Visibility(
                          visible: !context
                              .watch<SuratJalanCubit>()
                              .state
                              .isFetchingList,
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              // var petugasEnabled = false;
                              var kurirEnabled = false;
                              var reportEnabled = false;
                              if (state is AuthSuccess) {
                                print(
                                    "state.loginResponse.user?.role: ${state.loginResponse.user?.role}");
                                if (state.loginResponse.user?.role == "Kurir") {
                                  // petugasEnabled = false;
                                  kurirEnabled = true;
                                } else {
                                  // petugasEnabled = true;
                                  kurirEnabled = false;
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.all(sizeMedium),
                                child: Table(
                                  children: [
                                    TableRow(children: [
                                      InkWell(
                                        onTap: kurirEnabled
                                            ? null
                                            : () {
                                                context
                                                    .read<SuratJalanCubit>()
                                                    .getSuratJalanPerPage(1,
                                                        menuStatusForTitle:
                                                            constPengiriman);
                                              },
                                        child: RoundedContainer(sizeMedium,
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.all(
                                                sizeNormal),
                                            clipBehavior: Clip.antiAlias,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                RoundedContainer(sizeMedium,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Stack(
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/background_main.png"),
                                                        Visibility(
                                                            visible:
                                                                kurirEnabled,
                                                            child:
                                                                Positioned.fill(
                                                                    child:
                                                                        Container(
                                                              color:
                                                                  Colors.grey,
                                                            ))),
                                                      ],
                                                    )),
                                                Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            minWidth: sizeHuge),
                                                    child: Column(
                                                      children: [
                                                        SvgPicture.asset(
                                                            "assets/images/iconoir_delivery_truck.svg"),
                                                        const CustomText(
                                                          constPengiriman,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            )),
                                      ),
                                      InkWell(
                                        onTap: kurirEnabled
                                            ? () {
                                                context
                                                    .read<SuratJalanCubit>()
                                                    .getSuratJalanPerPage(1,
                                                        menuStatusForTitle:
                                                            constPenerimaan);
                                              }
                                            : null,
                                        child: RoundedContainer(sizeMedium,
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.all(
                                                sizeNormal),
                                            clipBehavior: Clip.antiAlias,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                RoundedContainer(sizeMedium,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Stack(
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/background_main.png"),
                                                        Visibility(
                                                            visible:
                                                                !kurirEnabled,
                                                            child:
                                                                Positioned.fill(
                                                                    child:
                                                                        Container(
                                                              color:
                                                                  Colors.grey,
                                                            ))),
                                                      ],
                                                    )),
                                                Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            minWidth: sizeHuge),
                                                    child: Column(
                                                      children: [
                                                        SvgPicture.asset(
                                                            "assets/images/diterima_icon.svg"),
                                                        const CustomText(
                                                          constPenerimaan,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            )),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      InkWell(
                                        onTap: kurirEnabled
                                            ? () {
                                                context
                                                    .read<SuratJalanCubit>()
                                                    .getSuratJalanPerPage(1,
                                                        menuStatusForTitle:
                                                            constDistribusi);
                                                context
                                                    .read<SuratJalanCubit>()
                                                    .setWillScanDus();
                                              }
                                            : null,
                                        child: RoundedContainer(sizeMedium,
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.all(
                                                sizeNormal),
                                            clipBehavior: Clip.antiAlias,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                RoundedContainer(sizeMedium,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Stack(
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/background_main.png"),
                                                        Visibility(
                                                            visible:
                                                                !kurirEnabled,
                                                            child:
                                                                Positioned.fill(
                                                                    child:
                                                                        Container(
                                                              color:
                                                                  Colors.grey,
                                                            ))),
                                                      ],
                                                    )),
                                                Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            minWidth: sizeHuge),
                                                    child: Column(
                                                      children: [
                                                        SvgPicture.asset(
                                                            "assets/images/distribution_icon.svg"),
                                                        const CustomText(
                                                          constDistribusi,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            )),
                                      ),
                                      RoundedContainer(sizeMedium,
                                          padding: const EdgeInsets.all(0),
                                          margin:
                                              const EdgeInsets.all(sizeNormal),
                                          clipBehavior: Clip.antiAlias,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              RoundedContainer(sizeMedium,
                                                  margin:
                                                      const EdgeInsets.all(0),
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                          "assets/images/background_main.png"),
                                                      Visibility(
                                                          visible:
                                                              !reportEnabled,
                                                          child:
                                                              Positioned.fill(
                                                                  child:
                                                                      Container(
                                                            color: Colors.grey,
                                                          ))),
                                                    ],
                                                  )),
                                              Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          minWidth: sizeHuge),
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/images/laporan_icon.svg"),
                                                      const CustomText(
                                                        constLaporan,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          )),
                                    ])
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Builder(builder: (context) {
                          var suratJalanCubitState =
                              context.watch<SuratJalanCubit>().state;
                          return Visibility(
                              visible: suratJalanCubitState.isFetchingList,
                              child: Column(
                                children: [
                                  Builder(builder: (context) {
                                    var suratJalanState =
                                        context.watch<SuratJalanCubit>().state;
                                    var listSJ = suratJalanState
                                            .suratJalanResponse?.data?.data
                                            ?.where((element) =>
                                                (element.total ?? "")
                                                    .isNotEmpty &&
                                                (int.parse(
                                                        element.total ?? "0") !=
                                                    int.parse(element.selesai ??
                                                        "0")))
                                            .toList() ??
                                        [];
                                    var internetConnection = context
                                        .watch<InternetConnectionCubit>()
                                        .state
                                        .isOnline;
                                    // var suratJalanResponseList = suratJalanState
                                    //         .suratJalanResponse?.data?.data ??
                                    //     [];

                                    log("listSJ: $listSJ");
                                    if (!internetConnection) {
                                      return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(sizeMedium),
                                          child: Text(
                                              "No Internet Connection, Tap to Refresh"),
                                        ),
                                      );
                                    }
                                    ;
                                    if ((suratJalanState.suratJalanResponse
                                                ?.data?.total ??
                                            0) ==
                                        0) {
                                      return SvgPicture.asset(
                                        "assets/images/empty_data.svg",
                                        width: sizeHuge * 2,
                                      );
                                    }
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          top: sizeMedium),
                                      padding: const EdgeInsets.all(sizeNormal),
                                      child: suratJalanState.isLoading
                                          ? const CircularProgressIndicator(
                                              color: primaryGreen,
                                            )
                                          : ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: listSJ.length ?? 0,
                                              itemBuilder: (c, i) {
                                                return InkWell(
                                                  onTap: () async {
                                                    var qrBloc = context
                                                        .read<QRScanBloc>();
                                                    // myToast("${listSJ?[i].qrcodeSj}");
                                                    qrBloc.add(BulkQRScanEvent(
                                                        // textValue
                                                        // controller.text
                                                        "${listSJ[i].qrcodeSj}"));
                                                    await context.router
                                                        .push(BulkScanRoute(
                                                      qrScanBloc: qrBloc,
                                                      firstTimeScan: false,
                                                      willScanDus:
                                                          suratJalanCubitState
                                                              .willScanDus,
                                                      qrCode:
                                                          listSJ[i].qrcodeSj ??
                                                              "-",
                                                    ));
                                                  },
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Card(
                                                          color: Colors.white,
                                                          // i % 2 == 0 ? listColorLight : listColorDark,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const CustomText(
                                                                  "Kode Surat Jalan",
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                FittedBox(
                                                                    child:
                                                                        CustomText(
                                                                  // "003/SPJ/22-MERANTI00098-000${i + 1}",
                                                                  "${listSJ?[i].qrcodeSj}",
                                                                  // color: primaryColor,
                                                                  weight:
                                                                      FontWeight
                                                                          .bold,
                                                                )),
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          sizeNormal),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Flexible(
                                                                          child:
                                                                              Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          const FittedBox(
                                                                            child:
                                                                                CustomText(
                                                                              "Dalam Proses",
                                                                              // color:
                                                                              // primaryColor,
                                                                            ),
                                                                          ),
                                                                          CustomText(
                                                                            indonesianNumberFormat((int.parse(listSJ?[i].total ?? "0") - int.parse(listSJ?[i].selesai ?? "0")).toString()),
                                                                            // color: primaryColor,
                                                                            weight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ],
                                                                      )),
                                                                      Flexible(
                                                                          child:
                                                                              Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          const FittedBox(
                                                                            child:
                                                                                CustomText(
                                                                              "Selesai Diterima",
                                                                              // color:
                                                                              // primaryColor,
                                                                            ),
                                                                          ),
                                                                          CustomText(
                                                                            indonesianNumberFormat(listSJ?[i].selesai ??
                                                                                "0"),
                                                                            // color: primaryColor,
                                                                            weight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ],
                                                                      )),
                                                                      Flexible(
                                                                          child:
                                                                              Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          const CustomText(
                                                                            "Total",
                                                                            // color: primaryColor,
                                                                          ),
                                                                          CustomText(
                                                                            indonesianNumberFormat(listSJ?[i].total ??
                                                                                "0"),
                                                                            // color: primaryColor,
                                                                            weight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ],
                                                                      )),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                      SummaryStatusTagWidget(
                                                        total:
                                                            listSJ[i].total ??
                                                                "0",
                                                        onProses: listSJ[i]
                                                                .onproses ??
                                                            "0",
                                                        selesai:
                                                            listSJ[i].selesai ??
                                                                "0",
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }),
                                    );
                                  }),
                                  Builder(builder: (context) {
                                    var state =
                                        context.watch<SuratJalanCubit>().state;
                                    var isLoading = state.isLoading;
                                    var pageLength = ((state.suratJalanResponse
                                                    ?.data?.total ??
                                                0) ~/
                                            (state.suratJalanResponse?.data
                                                    ?.perPage ??
                                                1)) +
                                        1;
                                    print("pageLength $pageLength");
                                    if ((state.suratJalanResponse?.data
                                                ?.total ??
                                            0) ==
                                        0) {
                                      return Column(
                                        children: [
                                          const CustomText(
                                            "Data Belum Tersedia",
                                            // color: primaryColor,
                                            size: sizeMedium,
                                          ),
                                          const CustomText(
                                            "Mohon Lakukan Scan Terlebih dahulu",
                                          ),
                                        ],
                                      );
                                    }
                                    return isLoading
                                        ? const CircularProgressIndicator(
                                            color: primaryGreen,
                                          )
                                        : MyPaginator(
                                            pageLength: pageLength,
                                            onPageChanged: (index) {
                                              context
                                                  .read<SuratJalanCubit>()
                                                  .getSuratJalanPerPage(
                                                      index + 1);
                                              myToast("Index: $index");
                                            },
                                          );
                                  }),
                                  Builder(builder: (context) {
                                    var appBarTitle = context
                                            .watch<SuratJalanCubit>()
                                            .state
                                            .menuStatusForTitle ??
                                        "-";

                                    return Visibility(
                                      visible:
                                          !(appBarTitle == constDistribusi),
                                      child: Container(
                                        height: orientedHeightScreen(context,
                                            portraitRatio: 0.20,
                                            landscapeRatio: 0.20),
                                        margin: const EdgeInsets.only(
                                            top: sizeMedium,
                                            bottom: sizeHuge * 2),
                                        child: FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FittedBox(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        // context.router.push(
                                                        //     const TestDhriveRoute()
                                                        // );
                                                        await BarcodeScanner
                                                                .scan()
                                                            .then((ScanResult
                                                                bulkDetail) async {
                                                          if (bulkDetail
                                                              .rawContent
                                                              .isNotEmpty) {
                                                            var qrBloc =
                                                                context.read<
                                                                    QRScanBloc>();
                                                            print(
                                                                "bulkDetail ${bulkDetail.rawContent}");
                                                            qrBloc.add(
                                                                BulkQRScanEvent(
                                                                    // "003SPJ34-JATIMPARK0213232-0002",
                                                                    bulkDetail
                                                                        .rawContent));
                                                            await context.router
                                                                .push(
                                                                    BulkScanRoute(
                                                              qrScanBloc:
                                                                  qrBloc,
                                                              qrCode: bulkDetail
                                                                      .rawContent ??
                                                                  "-",
                                                            ));
                                                          }
                                                        });
                                                      },
                                                      child:
                                                          const RoundedContainer(
                                                        sizeMedium,
                                                        padding: EdgeInsets.all(
                                                            sizeBig),
                                                        margin: EdgeInsets.only(
                                                            right: sizeMedium,
                                                            left: sizeMedium,
                                                            top: sizeMedium,
                                                            bottom: sizeNormal),
                                                        boxDecoration:
                                                            BoxDecoration(
                                                                color:
                                                                    primaryColor),
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
                                                      "Scan Surat Jalan",
                                                      textAlign:
                                                          TextAlign.center,
                                                      // color: primaryColor,
                                                    )
                                                  ]..map((e) => FittedBox(
                                                        child: e,
                                                      )),
                                                ),
                                              ),
                                              // FittedBox(
                                              //   child: Column(
                                              //     children: [
                                              //       InkWell(
                                              //         onTap: () {
                                              //
                                              //         },
                                              //         child: RoundedContainer(
                                              //           sizeMedium,
                                              //           padding: const EdgeInsets.all(sizeBig),
                                              //           margin: const EdgeInsets.only(
                                              //               right: sizeMedium,
                                              //               left: sizeMedium,
                                              //               top: sizeMedium,
                                              //               bottom: sizeNormal),
                                              //           boxDecoration: const BoxDecoration(
                                              //               color: primaryGreen),
                                              //           child: SvgPicture.asset(
                                              //               "assets/images/camera_white.svg"),
                                              //         ),
                                              //       ),
                                              //       const CustomText(
                                              //         "Dus",
                                              //         textAlign: TextAlign.center,
                                              //         color: primaryGreen,
                                              //       )
                                              //     ]..map((e) => FittedBox(child: e)),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ));
                        })
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: const CustomBottomNavbar(activeIndex: 2),
        ),
      ),
    );
  }
}
