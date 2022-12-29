import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../text/custom_text.dart';

class SummaryStatusTagWidget extends StatefulWidget {
  final String total;
  final String onProses;
  final String selesai;
  const SummaryStatusTagWidget({
    required this.total,
    required this.onProses,
    required this.selesai,
    Key? key}) : super(key: key);

  @override
  _SummaryStatusTagWidgetState createState() => _SummaryStatusTagWidgetState();
}

class _SummaryStatusTagWidgetState extends State<SummaryStatusTagWidget> {
  String status = "Dikirim";
  @override
  void initState() {
    super.initState();
    int selesai = int.tryParse(widget.selesai) ?? 0;
    int onProses = int.tryParse(widget.onProses) ?? 0;
    int total = int.tryParse(widget.total) ?? 0;

    /// FIXME masih harus tanya soal ini
    if(onProses!=total&&selesai!=total) status = "On Proses";
    if(selesai == total) status = "Selesai";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(
          minWidth: sizeHuge+sizeNormal,
          maxWidth: sizeHuge+sizeNormal,
        ),
        margin: const EdgeInsets.only(top: sizeNormal),
        padding: const EdgeInsets.symmetric(horizontal: sizeNormal, vertical: 0),
        decoration: BoxDecoration(color: status == "Selesai" ? selesaiTagColor : dikirimTagColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(sizeMedium), bottomLeft: Radius.circular(sizeMedium)),
        ),
        child: Center(child: FittedBox(child: CustomText(status,color: Colors.white,))));
  }
}
