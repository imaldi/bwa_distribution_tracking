import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanResultScreen extends StatelessWidget
implements AutoRouteWrapper
{
  const ScanResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Center(child: Text("Asd",softWrap: true,),),);
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: sl<QRScanBloc>(),child: this,);
  }
}
