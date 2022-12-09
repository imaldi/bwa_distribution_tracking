import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/history_scan/history_scan_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/history_scan/history_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/list_tile/history_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersHistoryScreen extends StatefulWidget {
  const UsersHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UsersHistoryScreen> createState() => _UsersHistoryScreenState();
}

class _UsersHistoryScreenState extends State<UsersHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryScanBloc>().add(GetUserScanHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocConsumer<HistoryScanBloc, HistoryScanState>(
              listener: (c, state) {
                if (state is UserHistoryScanLoaded) {
                  c
                      .read<HistoryScanCubit>()
                      .initUserHistory(state.scanUserHistoryResponse);
                }
              },
              builder: (context, state) {
                // var stringg = "";
                var listData = <SendScanDataModel>[];
                listData.addAll(context
                        .watch<HistoryScanCubit>()
                        .state
                        .scanUserHistoryResponse
                        ?.data ??
                    []);

                // return Text(stringg);
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: sizeMedium, vertical: sizeBig),
                    itemCount: listData.length,
                    itemBuilder: (c, i) {
                      var stateSomething = listData[i].nosj;

                      return HistoryListTile(
                        index: i,
                        dateTime: listData[i].updatedAt ?? DateTime.now(),
                        status: listData[i].statusPengiriman ??
                            "Paket Belum Sampai",
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
