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
import '../../core/resources/media_query/media_query_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';

//test push
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
    var controller = TextEditingController();
    return WillPopScope(
      onWillPop: () async {
        // myToast("Heey");
        context.read<SuratJalanCubit>().resetStatusPengiriman();
        return false;
      },
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              BlocBuilder<AuthBloc, AuthState>(
                                                  builder: (bc, authState) {
                                                return BlocListener<AuthBloc,
                                                    AuthState>(
                                                  listener: (BuildContext context,
                                                      state) {
                                                    if (state is AuthLoggedOut) {
                                                      context.router.replace(
                                                          const LoginRoute());
                                                    }
                                                  },
                                                  child: InkWell(
                                                    onTap: () {
                                                      bc.read<AuthBloc>().add(
                                                          const UserLogoutAuthEvent());
                                                    },
                                                    // backgroundColor: primaryBlue,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons.logout,
                                                          color: Colors.white,
                                                          size: sizeBig,
                                                        ),
                                                        CustomText(
                                                          "Logout",
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                          Container(
                                            // color: primaryGreen,
                                            height: orientedHeightScreen(context,
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
                                                  const FittedBox(
                                                    child: CustomText(
                                                      "SELAMAT DATANG PETUGAS",
                                                      color: Colors.white,
                                                      size: sizeBig,
                                                      weight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  FittedBox(child: BlocBuilder<
                                                      AuthBloc, AuthState>(
                                                    builder: (context, state) {
                                                      /// FIXME ada bug nama null kalau di hot restart, why??
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

                                          Container(
                                            // color: Colors.green,
                                            height: orientedHeightScreen(context,
                                                portraitRatio: 0.15,
                                                landscapeRatio: 0.15),
                                            padding:
                                                const EdgeInsets.all(sizeNormal),
                                            child: Column(
                                              children: [
                                                const CustomText(
                                                  "Masukkan Nomor Surat Jalan",
                                                  color: Colors.white,
                                                ),
                                                RoundedContainer(
                                                  sizeMedium,
                                                  boxDecoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        width: 3.0,
                                                        color: Colors.white),
                                                    // borderRadius: BorderRadius.all(Radius.circular(sizeBig)),
                                                  ),
                                                  child: NoUnderlineTextFormField(
                                                    controller: controller,
                                                    onEditingComplete: () {
                                                      var state = context
                                                          .read<AuthBloc>()
                                                          .state;
                                                      if (state is AuthSuccess) {
                                                        // textValue = controller.text;
                                                        var qrBloc = context
                                                            .read<QRScanBloc>();
                                                        // var isNewScan
                                                        qrBloc.add(
                                                            const BulkQRScanEvent(
                                                                // textValue
                                                                // controller.text
                                                                "003SPJ22-MERANTI00098-0002"));
                                                        context.router.push(
                                                            BulkScanRoute(
                                                                qrScanBloc:
                                                                    qrBloc));
                                                      }
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration:
                                                        const InputDecoration(
                                                            // label: Center(child: CustomText("Kode UPC",color: Colors.white,)),
                                                            hintStyle: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                            // filled: true,
                                                            hintText:
                                                                "Nomor Surat Jalan"),
                                                  ),
                                                ),
                                              ],
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
                          visible: context.watch<SuratJalanCubit>().state.statusPengiriman.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.all(sizeMedium),
                            child: Table(
                              children: [
                                TableRow(children: [
                                  InkWell(
                                    onTap:(){
                                      context.read<SuratJalanCubit>().getSuratJalanPerPage(1);
                                    },
                                    child: RoundedContainer(sizeMedium,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(sizeNormal),
                                        clipBehavior: Clip.antiAlias,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            RoundedContainer(sizeMedium,
                                                margin: const EdgeInsets.all(0),
                                                padding: const EdgeInsets.all(0),
                                                child: Image.asset(
                                                    "assets/images/background_main.png")),
                                            Container(
                                                constraints: const BoxConstraints(
                                                    minWidth: sizeHuge),
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/images/iconoir_delivery_truck.svg"),
                                                    CustomText(
                                                      "Pengiriman",
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                )),
                                          ],
                                        )),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      context.read<SuratJalanCubit>().getSuratJalanPerPage(1);
                                    },
                                    child: RoundedContainer(sizeMedium,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(sizeNormal),
                                        clipBehavior: Clip.antiAlias,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            RoundedContainer(sizeMedium,
                                                margin: const EdgeInsets.all(0),
                                                padding: const EdgeInsets.all(0),
                                                child: Image.asset(
                                                    "assets/images/background_main.png")),
                                            Container(
                                                constraints: const BoxConstraints(
                                                    minWidth: sizeHuge),
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/images/diterima_icon.svg"),
                                                    CustomText(
                                                      "Penerimaan",
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
                                    onTap: (){
                                      context.read<SuratJalanCubit>().getSuratJalanPerPage(1);
                                    },
                                    child: RoundedContainer(sizeMedium,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(sizeNormal),
                                        clipBehavior: Clip.antiAlias,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            RoundedContainer(sizeMedium,
                                                margin: const EdgeInsets.all(0),
                                                padding: const EdgeInsets.all(0),
                                                child: Image.asset(
                                                    "assets/images/background_main.png")),
                                            Container(
                                                constraints: const BoxConstraints(
                                                    minWidth: sizeHuge),
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/images/distribution_icon.svg"),
                                                    CustomText(
                                                      "Distribusi",
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                )),
                                          ],
                                        )),
                                  ),
                                  RoundedContainer(sizeMedium,
                                      padding: const EdgeInsets.all(0),
                                      margin: const EdgeInsets.all(sizeNormal),
                                      clipBehavior: Clip.antiAlias,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          RoundedContainer(sizeMedium,
                                              margin: const EdgeInsets.all(0),
                                              padding: const EdgeInsets.all(0),
                                              child: Image.asset(
                                                  "assets/images/background_main.png")),
                                          Container(
                                              constraints: const BoxConstraints(
                                                  minWidth: sizeHuge),
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/images/laporan_icon.svg"),
                                                  CustomText(
                                                    "Laporan",
                                                    color: Colors.white,
                                                  )
                                                ],
                                              )),
                                        ],
                                      )),
                                ])
                              ],
                            ),
                          ),
                        ),
                       Builder(
                         builder: (context) {
                           var suratJalanCubitState = context.watch<SuratJalanCubit>().state;
                           return Visibility(
                               visible: suratJalanCubitState.statusPengiriman.isNotEmpty,
                               child: Column(children: [
                             Builder(builder: (context) {
                               var suratJalanState =
                                   context.watch<SuratJalanCubit>().state;
                               var listSJ =
                                   suratJalanState.suratJalanResponse?.data?.data;
                               var internetConnection = context
                                   .watch<InternetConnectionCubit>()
                                   .state
                                   .isOnline;
                               var listTotal =
                                   suratJalanState.suratJalanResponse?.data?.total ??
                                       0;
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
                               if((suratJalanState.suratJalanResponse?.data?.total ?? 0) == 0){
                                 return SvgPicture.asset("assets/images/empty_data.svg",width: sizeHuge*2,);
                               }
                               return Container(
                                 margin: const EdgeInsets.only(top: sizeMedium),
                                 padding: const EdgeInsets.all(sizeNormal),
                                 child: suratJalanState.isLoading
                                     ? const CircularProgressIndicator(
                                   color: primaryGreen,
                                 )
                                     : ListView.builder(
                                     physics: const NeverScrollableScrollPhysics(),
                                     scrollDirection: Axis.vertical,
                                     shrinkWrap: true,
                                     itemCount: listSJ?.length ?? 0,
                                     itemBuilder: (c, i) {
                                       return InkWell(
                                         onTap: () {
                                           var qrBloc = context.read<QRScanBloc>();
                                           myToast("${listSJ?[i].qrcodeSj}");
                                           qrBloc.add(BulkQRScanEvent(
                                             // textValue
                                             // controller.text
                                               "${listSJ?[i].qrcodeSj}"));
                                           context.router.push(BulkScanRoute(
                                               qrScanBloc: qrBloc,
                                               firstTimeScan: false));
                                         },
                                         child: Card(
                                             color: Colors.white,
                                             // i % 2 == 0 ? listColorLight : listColorDark,
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.center,
                                                 children: [
                                                   const CustomText(
                                                     "Kode Surat Jalan",
                                                     color: Colors.white,
                                                   ),
                                                   FittedBox(
                                                       child: CustomText(
                                                         // "003/SPJ/22-MERANTI00098-000${i + 1}",
                                                         "${listSJ?[i].nosj}",
                                                         color: primaryColor,
                                                         weight: FontWeight.bold,
                                                       )),
                                                   Container(
                                                     margin: const EdgeInsets.only(
                                                         top: sizeNormal),
                                                     child: Row(
                                                       mainAxisAlignment:
                                                       MainAxisAlignment
                                                           .spaceEvenly,
                                                       children: [
                                                         Flexible(
                                                             child: Column(
                                                               crossAxisAlignment:
                                                               CrossAxisAlignment
                                                                   .center,
                                                               children: [
                                                                 const FittedBox(
                                                                   child: CustomText(
                                                                     "Dalam Proses",
                                                                     color:
                                                                     primaryColor,
                                                                   ),
                                                                 ),
                                                                 CustomText(
                                                                   "${listSJ?[i].onproses}",
                                                                   color: primaryColor,
                                                                   weight:
                                                                   FontWeight.bold,
                                                                 ),
                                                               ],
                                                             )),
                                                         Flexible(
                                                             child: Column(
                                                               crossAxisAlignment:
                                                               CrossAxisAlignment
                                                                   .center,
                                                               children: [
                                                                 const FittedBox(
                                                                   child: CustomText(
                                                                     "Selesai Diterima",
                                                                     color:
                                                                     primaryColor,
                                                                   ),
                                                                 ),
                                                                 CustomText(
                                                                   "${listSJ?[i].selesai}",
                                                                   color: primaryColor,
                                                                   weight:
                                                                   FontWeight.bold,
                                                                 ),
                                                               ],
                                                             )),
                                                         Flexible(
                                                             child: Column(
                                                               crossAxisAlignment:
                                                               CrossAxisAlignment
                                                                   .center,
                                                               children: [
                                                                 const CustomText(
                                                                   "Total",
                                                                   color: primaryColor,
                                                                 ),
                                                                 CustomText(
                                                                   "${listSJ?[i].total}",
                                                                   color: primaryColor,
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
                                       );
                                     }),
                               );
                             }),
                             Builder(builder: (context) {
                               var state = context.watch<SuratJalanCubit>().state;
                               var isLoading = state.isLoading;
                               var pageLength =
                                   ((state.suratJalanResponse?.data?.total ?? 0) ~/
                                       (state.suratJalanResponse?.data?.perPage ??
                                           1)) +
                                       1;
                               print("pageLength $pageLength");
                               if((state.suratJalanResponse?.data?.total ?? 0) == 0){
                                 return Column(
                                   children: [
                                     const CustomText("Data Belum Tersedia",color: primaryColor,size: sizeMedium,),
                                     const CustomText("Mohon Lakukan Scan Terlebih dahulu",),
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
                                           .getSuratJalanPerPage(index + 1);
                                       myToast("Index: $index");
                                     },
                                   );
                             }),
                             Container(
                               height: orientedHeightScreen(context,
                                   portraitRatio: 0.20, landscapeRatio: 0.20),
                               margin: const EdgeInsets.only(top:sizeMedium, bottom: sizeNormal),
                               child: FittedBox(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     FittedBox(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           InkWell(
                                             onTap: () async {
                                               // context.router.push(
                                               //     const TestDhriveRoute()
                                               // );
                                               await BarcodeScanner.scan()
                                                   .then((ScanResult bulkDetail) {
                                                 if (bulkDetail
                                                     .rawContent.isNotEmpty) {
                                                   var qrBloc =
                                                   context.read<QRScanBloc>();
                                                   print(
                                                       "bulkDetail ${bulkDetail.rawContent}");
                                                   qrBloc.add(BulkQRScanEvent(
                                                     "003SPJ34-JATIMPARK0213232-0002",
                                                     // bulkDetail.rawContent
                                                   ));
                                                   context.router.push(BulkScanRoute(
                                                       qrScanBloc: qrBloc));
                                                 }
                                               });
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
                                             "Surat Jalan",
                                             textAlign: TextAlign.center,
                                             color: primaryColor,
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
                           ],));
                         }
                       )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // todo make this a widget that is given in every corresponding screen
          bottomNavigationBar: ConvexAppBar(
            /// Fixme for landscape orientation
            onTap: (index) {
              myToast("index: $index");
            },
            height: heightScreen(context) / 12,
            curveSize: widthScreen(context) / 3,
            style: TabStyle.fixedCircle,
            backgroundColor: Colors.white,
            color: primaryGreen,
            elevation: 2,
            activeColor: primaryBlue,
            items: [
              const TabItem(
                title: "Logout",
                icon: Icon(Icons.logout),
                isIconBlend: true,
              ),
              const TabItem(
                title: "Logout",
                icon: Icon(Icons.notifications_active_outlined),
                isIconBlend: true,
              ),
              TabItem(
                icon:
                    // UnconstrainedBox(child: SizedBox(height: sizeMedium,width: sizeMedium,child: Container(color: Colors.white,),)),
                    UnconstrainedBox(
                        child: SvgPicture.asset(
                  "assets/images/home_icon_outlined.svg",
                  width: sizeBig,
                  height: sizeBig,
                )),
                // FloatingActionButton(
                //     backgroundColor: primaryColor,
                //     onPressed:null,elevation:0,child: SvgPicture.asset("assets/images/home_icon_outlined.svg")),
                isIconBlend: true,
              ),
              const TabItem(
                title: "Notif",
                icon: Icon(Icons.notifications_active_outlined),
                isIconBlend: true,
              ),
              const TabItem(
                title: "Profile",
                icon: Icon(Icons.person_outline),
                isIconBlend: true,
              ),
            ],
          )
          // ConvexButton.fab(
          //   onTap: () => setState(() => print("afasfd")),
          // ),
          ),
    );
  }
}
