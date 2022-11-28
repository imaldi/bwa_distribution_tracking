import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SingleScanScreen extends StatefulWidget implements AutoRouteWrapper {
  @override
  State<StatefulWidget> createState() => _SingleScanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

}

class _SingleScanScreenState extends State<SingleScanScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single Scan"),),
      body: Center(child: Text("heyy")),
    );
  }

}