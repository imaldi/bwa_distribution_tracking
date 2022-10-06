import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BulkScanScreen extends StatelessWidget implements AutoRouteWrapper {
  final QRScanBloc qrScanBloc;
  const BulkScanScreen({required this.qrScanBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          var name = "";
          if(state is AuthSuccess) {
            name = state.loginResponse.user?.name ?? "";
          }


          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello $name"),
                BlocBuilder<QRScanBloc,QRScanState>(builder: (c,s) {
                  var response;
                  if(s is QRBulkScanSuccess){
                    response = s.bulkScanResponse;
                  }

                  if(s is QRScanFailed){
                    response = "null";
                  }
                  return Text("The Response: ${response.toString()}",softWrap: true,);
                })
              ],
            ),
          );
        },
      ),),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: qrScanBloc, child: this,);
  }
}
