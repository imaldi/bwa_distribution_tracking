import 'package:bwa_distribution_tracking/presentation/blocs/history_scan/history_scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersHistoryScreen extends StatelessWidget {
  const UsersHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This is Users History"),
        BlocBuilder<HistoryScanBloc, HistoryScanState>(

          builder: (context, state) {
            var stringg = "";
            if(state is HistoryScanLoaded){
              stringg = state.scanUserHistoryResponse.data?[0].nosj ?? "";
            }
            return Text(stringg);
          },
        ),
      ],
    ),);
  }
}
