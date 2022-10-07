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
import '../../presentation/pages/bulk_scan_screen.dart' as _i3;
import '../../presentation/pages/home_screen.dart' as _i2;
import '../../presentation/pages/login_screen.dart' as _i1;
import '../../presentation/pages/test_dhrive_screen.dart' as _i4;

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
    BulkScanRoute.name: (routeData) {
      final args = routeData.argsAs<BulkScanRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(
            child: _i3.BulkScanScreen(
          qrScanBloc: args.qrScanBloc,
          key: args.key,
        )),
      );
    },
    TestDhriveRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TestDhriveScreen(),
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
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
        ),
        _i5.RouteConfig(
          TestDhriveRoute.name,
          path: '/test-dhrive-screen',
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
/// [_i3.BulkScanScreen]
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

/// generated route for
/// [_i4.TestDhriveScreen]
class TestDhriveRoute extends _i5.PageRouteInfo<void> {
  const TestDhriveRoute()
      : super(
          TestDhriveRoute.name,
          path: '/test-dhrive-screen',
        );

  static const String name = 'TestDhriveRoute';
}
