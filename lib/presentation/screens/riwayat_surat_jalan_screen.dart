import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/surat_jalan/surat_jalan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/resources/consts/colors.dart';
import '../../core/resources/consts/sizes.dart';
import '../../injection_container.dart';
import '../widgets/custom_bottom_navbar/custom_bottom_navbar.dart';
import '../widgets/riwayat_screen_appbar_and_searchbar/riwayat_screen_appbar_and_searchbar.dart';
import '../widgets/summary_status_tag_widget/summary_status_tag_widget.dart';
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
        child: Builder(
          builder: (context) {
            var state = context.watch<SuratJalanCubit>().state;
            var suratJalanResponseList = state.suratJalanResponse?.data?.data ?? [];
            log("suratJalanResponseList hal riwayat $suratJalanResponseList");
            if(state.isLoading) {
              return Container(
                  child: Center(child: CircularProgressIndicator(color: primaryColor,),));
            }
            return Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SingleChildScrollView(
                    child: ListView.builder(
                      // padding: EdgeInsets.only(
                      //     top: orientedHeightScreen(context,
                      //         portraitRatio: 0.15, landscapeRatio: 0.15)),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: suratJalanResponseList.length + 1,
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
                                              children: [
                                                Flexible(
                                                  child:CustomText(
                                                    "${DateFormat("dd MMM yyyy . HH.mm", 'id').format(state.suratJalanResponse?.data?.data?[i-1].createdAt ?? DateTime(2000))} | ",
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: CustomText(
                                                    "Total ${state.suratJalanResponse?.data?.data?[i-1].total ?? "-"}",
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                SummaryStatusTagWidget(
                                  total: suratJalanResponseList[i-1].total ?? "0",
                                  onProses: suratJalanResponseList[i-1].onproses ?? "0",
                                  selesai: suratJalanResponseList[i-1].selesai ?? "0",
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  IntrinsicHeight(
                    child: Container(
                        color: Colors.white,
                        child: RiwayatScreenAppbarAndSearchbar()),
                  ),
                ],
              ),
            );
          }
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavbar(),
    );
  }
}
