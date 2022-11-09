import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/history_scan/cubit/history_scan_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/history_scan/history_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/list_tile/history_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllHistoryScreen extends StatefulWidget {
  const AllHistoryScreen({Key? key}) : super(key: key);

  @override
  State<AllHistoryScreen> createState() => _AllHistoryScreenState();
}

class _AllHistoryScreenState extends State<AllHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryScanBloc>().add(GetAllScanHistoryEvent());
  }
  @override
  Widget build(BuildContext context) {
    // return const Center(child: Text("This is All History"),);
    return Container(
      // color: Colors.green,
      child: BlocConsumer<HistoryScanBloc,HistoryScanState>(
        listener: (c,state){
          if(state is AllHistoryScanLoaded){
            c.read<HistoryScanCubit>().initUserHistory(state.scanAllHistoryResponse);
          }
        },
        builder: (context,state) {
          var listData = <SendScanDataModel>[];
          listData.addAll(context.watch<HistoryScanCubit>().state.scanUserHistoryResponse?.data ?? []);

          return ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: sizeMedium, vertical: sizeBig),
              itemCount: listData.length,
              itemBuilder: (c, i) {
                return HistoryListTile(index: i,dateTime: listData[i].updatedAt ?? DateTime.now(), status: listData[i].statusPengiriman ?? "Paket Belum Sampai",);
              });
        }
      ),);
  }
}
