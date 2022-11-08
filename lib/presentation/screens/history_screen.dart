import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
