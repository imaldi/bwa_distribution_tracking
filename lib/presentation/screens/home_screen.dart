import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/internet_connection/internet_connection_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text_form_field/no_underline_text_form_field.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

import '../../core/resources/consts/colors.dart';
import '../../core/resources/gradients/basic_linear_gradient.dart';
import '../../core/resources/media_query/media_query_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: sl<QRScanBloc>(),
      child: this,
    );
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
    var textValue = "003SPJ22-MERANTI00098-0002";
    var controller = TextEditingController();
    return Scaffold(
      body: BlocConsumer<InternetConnectionCubit, InternetConnectionState>(
        listener: (context, state) {
          if (!state.isOnline) {
            myToast("Internet Disconnected");
          }
          // else {
          //   myToast("Internet Reconnected");
          // }
          print("Internet Connected: ${state.isOnline}");
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: (){
              context.read<InternetConnectionCubit>().checkConnection();
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        // color: Colors.blue,
                        height: orientedHeightScreen(context,
                            portraitRatio: 0.75, landscapeRatio: 0.75),
                        width: orientedWidthScreen(context,
                            portraitRatio: 1, landscapeRatio: 1),
                        padding: EdgeInsets.fromLTRB(
                            sizeBig,
                            orientedHeightScreen(context,
                                portraitRatio: 0.05, landscapeRatio: 0.05),
                            // orientedValueOf<double>(context,
                            //     portraitValue: sizeBig, landscapeValue: sizeMedium),
                            sizeBig,
                            0),
                        decoration: const BoxDecoration(
                          // gradient: basicDiagonalGradient(),
                          color: primaryColor,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
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
                                        padding: const EdgeInsets.all(sizeNormal),
                                        child: Column(
                                          children: [
                                            const CustomText(
                                              "Masukkan UPC Anda",
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
                                                    qrBloc.add(const BulkQRScanEvent(
                                                        // textValue
                                                        // controller.text
                                                        "003SPJ22-MERANTI00098-0002"));
                                                    context.router.push(
                                                        BulkScanRoute(
                                                            qrScanBloc: qrBloc));
                                                  }
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                decoration: const InputDecoration(
                                                    // label: Center(child: CustomText("Kode UPC",color: Colors.white,)),
                                                    hintStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    // filled: true,
                                                    hintText: "Kode UPC"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: sizeMedium),
                                          height: orientedHeightScreen(context,
                                              portraitRatio: 0.15,
                                              landscapeRatio: 0.15),
                                          width: widthScreen(context),
                                          child: Card(
                                            color: const Color(0xFF00D3AD),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                SizedBox(height: sizeNormal),
                                                CustomText(
                                                  "Total Stack Keseluruhan",
                                                  color: Colors.white,
                                                ),
                                                Expanded(
                                                    child: FittedBox(
                                                        child: CustomText(
                                                  "50000",
                                                  color: Colors.white,
                                                  size: sizeHuge * 2,
                                                  weight: FontWeight.w600,
                                                ))),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: orientedHeightScreen(context,
                                            portraitRatio: 0.15,
                                            landscapeRatio: 0.15),
                                        width: widthScreen(context),
                                        child: FittedBox(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: sizeSmall),
                                                height: orientedHeightScreen(
                                                    context,
                                                    portraitRatio: 0.15,
                                                    landscapeRatio: 0.15),
                                                child: Card(
                                                  color: const Color(0xFFFFB259),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                  ),
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: sizeNormal),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          SizedBox(
                                                              height: sizeNormal),
                                                          Flexible(
                                                            child: FittedBox(
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            sizeNormal),
                                                                child: CustomText(
                                                                  "Stock Dalam Proses",
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: FittedBox(
                                                            child: CustomText(
                                                              "50000",
                                                              color: Colors.white,
                                                              size: sizeBig,
                                                              weight:
                                                                  FontWeight.w600,
                                                            ),
                                                          )),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                              Container(
                                                height: orientedHeightScreen(
                                                    context,
                                                    portraitRatio: 0.15,
                                                    landscapeRatio: 0.15),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: sizeSmall),
                                                child: Card(
                                                  color: const Color(0xFF9059FF),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                  ),
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: sizeNormal),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          SizedBox(
                                                              height: sizeNormal),
                                                          Flexible(
                                                            child: FittedBox(
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            sizeNormal),
                                                                child: CustomText(
                                                                  "Stock Selesai Diterima",
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: FittedBox(
                                                            child: CustomText(
                                                              "50000",
                                                              color: Colors.white,
                                                              size: sizeBig,
                                                              weight:
                                                                  FontWeight.w600,
                                                            ),
                                                          )),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ],
                                            // ]..map((e) => Expanded(child: e)),
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
                    Container(
                      height: orientedHeightScreen(context,
                          portraitRatio: 0.20, landscapeRatio: 0.20),
                      margin: const EdgeInsets.only(bottom: sizeNormal),
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
                                        if (bulkDetail.rawContent.isNotEmpty) {
                                          var qrBloc = context.read<QRScanBloc>();
                                          print(
                                              "bulkDetail ${bulkDetail.rawContent}");
                                          qrBloc.add(BulkQRScanEvent(
                                              bulkDetail.rawContent));
                                          context.router.push(
                                              BulkScanRoute(qrScanBloc: qrBloc));
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
                                      boxDecoration:
                                          const BoxDecoration(color: primaryBlue),
                                      child: SvgPicture.asset(
                                          "assets/images/camera_white.svg"),
                                    ),
                                  ),
                                  const CustomText(
                                    "Bulk Scan",
                                    textAlign: TextAlign.center,
                                    color: primaryBlue,
                                  )
                                ]..map((e) => FittedBox(
                                      child: e,
                                    )),
                              ),
                            ),
                            FittedBox(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.router
                                          .push(const HistoryRoute());
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
                                          color: primaryGreen),
                                      child: SvgPicture.asset(
                                          "assets/images/camera_white.svg"),
                                    ),
                                  ),
                                  const CustomText(
                                    "Single Scan",
                                    textAlign: TextAlign.center,
                                    color: primaryGreen,
                                  )
                                ]..map((e) => FittedBox(child: e)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<AuthBloc, AuthState>(builder: (bc, authState) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, state) {
            if (state is AuthLoggedOut) {
              context.router.replace(const LoginRoute());
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: sizeMedium),
            child: FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                bc.read<AuthBloc>().add(const UserLogoutAuthEvent());
              },
              backgroundColor: primaryBlue,
              child: const Icon(Icons.logout),
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
