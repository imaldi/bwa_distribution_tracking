// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../presentation/blocs/scan/qr_scan_bloc.dart' as _i7;
import '../../presentation/pages/bulk_scan_screen.dart' as _i4;
import '../../presentation/pages/home_screen.dart' as _i2;
import '../../presentation/pages/login_screen.dart' as _i1;
import '../../presentation/pages/scan_result_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.HomeScreen()),
      );
    },
    ScanResultRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.ScanResultScreen()),
      );
    },
    BulkScanRoute.name: (routeData) {
      final args = routeData.argsAs<BulkScanRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(
            child: _i4.BulkScanScreen(
          qrScanBloc: args.qrScanBloc,
          key: args.key,
        )),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/home-screen',
        ),
        _i5.RouteConfig(
          ScanResultRoute.name,
          path: '/scan-result-screen',
        ),
        _i5.RouteConfig(
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ScanResultScreen]
class ScanResultRoute extends _i5.PageRouteInfo<void> {
  const ScanResultRoute()
      : super(
          ScanResultRoute.name,
          path: '/scan-result-screen',
        );

  static const String name = 'ScanResultRoute';
}

/// generated route for
/// [_i4.BulkScanScreen]
class BulkScanRoute extends _i5.PageRouteInfo<BulkScanRouteArgs> {
  BulkScanRoute({
    required _i7.QRScanBloc qrScanBloc,
    _i6.Key? key,
  }) : super(
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
          args: BulkScanRouteArgs(
            qrScanBloc: qrScanBloc,
            key: key,
          ),
        );

  static const String name = 'BulkScanRoute';
}

class BulkScanRouteArgs {
  const BulkScanRouteArgs({
    required this.qrScanBloc,
    this.key,
  });

  final _i7.QRScanBloc qrScanBloc;

  final _i6.Key? key;

  @override
  String toString() {
    return 'BulkScanRouteArgs{qrScanBloc: $qrScanBloc, key: $key}';
  }
}
