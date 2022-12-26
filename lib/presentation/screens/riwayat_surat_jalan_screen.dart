import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/surat_jalan/surat_jalan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/resources/consts/colors.dart';
import '../../core/resources/consts/sizes.dart';
import '../../injection_container.dart';
import '../widgets/riwayat_screen_appbar_and_searchbar/riwayat_screen_appbar_and_searchbar.dart';
import '../widgets/text/custom_text.dart';

class RiwayatSuratJalanScreen extends StatefulWidget implements AutoRouteWrapper{
  const RiwayatSuratJalanScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatSuratJalanScreen> createState() => _RiwayatSuratJalanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => sl<SuratJalanCubit>(),
        child: this,
      ),
    ], child: this);
  }

}

class _RiwayatSuratJalanScreenState extends State<RiwayatSuratJalanScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SuratJalanCubit>().getSuratJalanPerPage(1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: Builder(
                  builder: (context) {
                    var state = context.read<SuratJalanCubit>().state;
                    return ListView.builder(
                        // padding: EdgeInsets.only(
                        //     top: orientedHeightScreen(context,
                        //         portraitRatio: 0.15, landscapeRatio: 0.15)),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 15+1,
                        itemBuilder: (c, i) {
                          if(i == 0) {
                            return RiwayatScreenAppbarAndSearchbar();
                          }
                          return InkWell(
                            onTap: () {
                              // Fixme beri qr code dari item listnya ya nanti
                              context.router.push(DetailPengirimanRoute(qrCode: state.suratJalanResponse?.data?.data?[i-1].qrcodeSj ?? "-"));
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Card(
                                    color: Colors.white,
                                    // i % 2 == 0 ? listColorLight : listColorDark,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const CustomText(
                                            "Kode Surat Jalan :",
                                            color: primaryColor,
                                            size: sizeMedium,
                                          ),
                                          FittedBox(
                                              child: CustomText(
                                                state.suratJalanResponse?.data?.data?[i-1].nosj ?? "-",
                                            color: primaryColor,
                                            size: sizeMedium+sizeSmall,
                                            weight: FontWeight.bold,
                                          )),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: sizeNormal),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Flexible(
                                                    child:CustomText(
                                            "21 Oct 2022 . 16.00 | ",
                                              color: primaryColor,
                                            ),
                                          ),
                                                Flexible(
                                                    child: CustomText(
                                                      "Total 200",
                                                      color: primaryColor,
                                                    ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Container(
                                  constraints: const BoxConstraints(
                                      minWidth: sizeHuge+sizeNormal,
                                      maxWidth: sizeHuge+sizeNormal,
                                  ),
                                  margin: const EdgeInsets.only(top: sizeNormal),
                                  padding: const EdgeInsets.symmetric(horizontal: sizeNormal, vertical: 0),
                                    decoration: const BoxDecoration(color: selesaiTagColor,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(sizeMedium), bottomLeft: Radius.circular(sizeMedium)),
                                    ),
                                    child: const Center(child: FittedBox(child: CustomText("Selesai",color: Colors.white,))))
                              ],
                            ),
                          );
                        });
                  }
                ),
              ),
              IntrinsicHeight(
                child: Container(
                    color: Colors.white,
                    child: RiwayatScreenAppbarAndSearchbar()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
