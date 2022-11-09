import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryListTile extends StatelessWidget {
  final int index;
  final DateTime dateTime;
  final String status;
  const HistoryListTile({
    required this.index,
    required this.dateTime,
    required this.status,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(top: sizeNormal),
        child: Icon(Icons.circle, size: sizeNormal,),
      ),
      horizontalTitleGap: 0,
      title: FittedBox(child: CustomText("Drop Point ${index+1} (Jam: ${DateFormat('hh:mm').format(dateTime)} | ${DateFormat('dd-MM-yyyy').format(dateTime)})",color: primaryColor,weight: FontWeight.w600,)),
      subtitle: CustomText(status,color: primaryColor,weight: FontWeight.w400,),);
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
    // );
  }
}
