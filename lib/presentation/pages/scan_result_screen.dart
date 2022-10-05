import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanResultScreen extends StatefulWidget implements AutoRouteWrapper {
  const ScanResultScreen({Key? key}) : super(key: key);

  @override
  State<ScanResultScreen> createState() => _ScanResultScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: sl<QRScanBloc>(),
      child: this,
    );
  }
}

class _ScanResultScreenState extends State<ScanResultScreen> {
  @override
  void initState() {
    super.initState();
    print("Init is called man");
    /// NOTE ternyata kalau manggil cubit dari dalam Widget yang
    /// sudah di provide dengan get it, memanggilnya harus dengan context
    context.read<QRScanBloc>().add(MunculkanToastEvent());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      BlocConsumer<QRScanBloc,QRScanState>(
        listener: (c,s){
          print(
              "BlocConsumer.listener QR: ${s.toString()}");
          if(s is ToastMunculState) {
            myToast("Init nih");
          }
        },
        builder: (c,sta) {
          print(
              "BlocConsumer.builder QR: ${sta.runtimeType}");
          if (sta is QRScanLoading) {
            return Container(
              child: const Center(
                child: SizedBox(
                    child: CircularProgressIndicator(
                      color: primaryBlue,
                    )),
              ),
            );
          }
          return Container(
          child: Center(
            child: Text(
              "state is: ${sta.runtimeType}",
              softWrap: true,
            ),
          ),
        );
        },
      ),
    );
  }


}
