import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/history_scan/history_scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllHistoryScreen extends StatelessWidget {
  const AllHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Center(child: Text("This is All History"),);
    return Container(
      // color: Colors.green,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: sizeMedium, vertical: sizeBig),
          itemCount: 4,
          itemBuilder: (c, i) {
            return Column(
              children: [
                BlocBuilder<HistoryScanBloc, HistoryScanState>(
                  builder: (context, state) {
                    var stateString = "";
                    if(state is HistoryScanLoaded){
                      stateString = state.scanUserHistoryResponse.data?[0].nosj ?? "";
                    }
                    return Text("hmmm: ${stateString}");
                  },
                ),
                Container(
                  // color: Colors.blue,
                  child:
                  const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: sizeNormal),
                      child: Icon(Icons.circle, size: sizeNormal,),
                    ),
                    horizontalTitleGap: 0,
                    title: Text("hello"),
                    subtitle: Text("hello"),),
                  // IntrinsicHeight(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         color: Colors.yellow,
                  //         child: Column(
                  //           children: [
                  //             // SizedBox(height: sizeNormal,),
                  //             Flexible(child: Icon(Icons.circle,size: sizeMedium,)),
                  //             Expanded(
                  //               child: Container(
                  //                 decoration: const BoxDecoration(
                  //                     color: Colors.red,
                  //                     border: Border(left: BorderSide(width: 2,color: Colors.white))),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(child:
                  //       Container(
                  //           color: Colors.brown,
                  //           child: const Text("This is All History"))
                  //       // ListTile(title: )
                  //       ),
                  //     ],
                  //   ),
                  // )
                ),
              ],
            );
          }),);
  }
}
