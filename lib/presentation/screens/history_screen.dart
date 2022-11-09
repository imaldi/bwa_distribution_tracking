import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/history_scan/cubit/history_scan_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/history_scan/history_scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget implements AutoRouteWrapper {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>sl<HistoryScanBloc>()),
      BlocProvider(create: (_)=>HistoryScanCubit()),

    ],
      child: this,);
  }

  @override
  _HistoryScreenState createState() => _HistoryScreenState();

}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context.read<HistoryScanBloc>().add(TestKeptHistoryStateEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        AllHistoryRoute(),
        UsersHistoryRoute(),
        DusHistoryRoute()
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("History Screen"),
            leading: const AutoLeadingButton(),
            bottom: TabBar(
              controller: controller,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Users'),
                Tab(text: 'Dus'),
              ],),
          ),
          body: child,
        );
      },
    );
  }
}
