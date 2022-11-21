import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_position.dart';
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
      BlocProvider(create: (_)=>HistoryScanCubit(sl<GetCurrentPositionUseCase>())),

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
    context.read<HistoryScanCubit>().getCurrentCoordinate();
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
        // set posisi awal di lokasi drop point paling awal
        var selectedPoint = context.watch<HistoryScanCubit>().state.selectedPoint;
        double lat = double.parse(selectedPoint?.latitude  ?? "0");
        double long = double.parse(selectedPoint?.longtitude ?? "0");

        // ga jadi pakai google map, harus pakai API key


        return Scaffold(
          appBar: AppBar(
            title: const Text("History Screen"),
            leading: const AutoLeadingButton(),
            // bottom: ,
          ),
          body: Column(
            children: [
              // Expanded(
              //   // height: MediaQuery.of(context).size.height,
              //   // width: MediaQuery.of(context).size.width,
              //   child: GoogleMap(
              //     mapType: MapType.normal,
              //     initialCameraPosition: initPosition,
              //     markers: _markers,
              //     onMapCreated: (GoogleMapController controller) {
              //       _controller.complete(controller);
              //       setState(() {
              //         _markers.add(Marker(
              //           markerId: MarkerId('marker_1'),
              //           position: LatLng(lat, long),
              //         ));
              //       });
              //     },
              //     minMaxZoomPreference: MinMaxZoomPreference(16, 18),
              //     myLocationEnabled: true,
              //   ),
              // ),
              Material(
                color: Colors.grey,
                child: TabBar(
                  controller: controller,
                  indicatorColor: primaryGreen,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                  //   if (states.contains(MaterialState.selected))
                  //     {
                  //       return primaryGreen; //<-- SEE HERE
                  //     }
                  //   return null;
                  // },),
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Users'),
                    Tab(text: 'Dus'),
                  ],),
              ),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}
