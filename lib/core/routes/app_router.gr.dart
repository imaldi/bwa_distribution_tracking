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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../presentation/blocs/scan/qr_scan_bloc.dart' as _i13;
import '../../presentation/screens/bulk_scan_screen.dart' as _i3;
import '../../presentation/screens/history_children_screen/all_history_screen.dart'
    as _i8;
import '../../presentation/screens/history_children_screen/dus_history_screen.dart'
    as _i10;
import '../../presentation/screens/history_children_screen/users_history_screen.dart'
    as _i9;
import '../../presentation/screens/history_screen.dart' as _i5;
import '../../presentation/screens/home_screen.dart' as _i2;
import '../../presentation/screens/login_screen.dart' as _i1;
import '../../presentation/screens/riwayat_surat_jalan_screen.dart' as _i7;
import '../../presentation/screens/single_scan_screen.dart' as _i6;
import '../../presentation/screens/test_dhrive_screen.dart' as _i4;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i2.HomeScreen()),
      );
    },
    BulkScanRoute.name: (routeData) {
      final args = routeData.argsAs<BulkScanRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
            child: _i3.BulkScanScreen(
          qrScanBloc: args.qrScanBloc,
          firstTimeScan: args.firstTimeScan,
          key: args.key,
        )),
      );
    },
    TestDhriveRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TestDhriveScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i5.HistoryScreen()),
      );
    },
    SingleScanRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i6.SingleScanScreen()),
      );
    },
    RiwayatSuratJalanRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RiwayatSuratJalanScreen(),
      );
    },
    AllHistoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AllHistoryScreen(),
      );
    },
    UsersHistoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.UsersHistoryScreen(),
      );
    },
    DusHistoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.DusHistoryScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          HomeRoute.name,
          path: '/home-screen',
        ),
        _i11.RouteConfig(
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
        ),
        _i11.RouteConfig(
          TestDhriveRoute.name,
          path: '/test-dhrive-screen',
        ),
        _i11.RouteConfig(
          HistoryRoute.name,
          path: '/history-screen',
          children: [
            _i11.RouteConfig(
              AllHistoryRoute.name,
              path: '',
              parent: HistoryRoute.name,
            ),
            _i11.RouteConfig(
              UsersHistoryRoute.name,
              path: 'users-history-screen',
              parent: HistoryRoute.name,
            ),
            _i11.RouteConfig(
              DusHistoryRoute.name,
              path: 'dus-history-screen',
              parent: HistoryRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          SingleScanRoute.name,
          path: '/single-scan-screen',
        ),
        _i11.RouteConfig(
          RiwayatSuratJalanRoute.name,
          path: '/riwayat-surat-jalan-screen',
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BulkScanScreen]
class BulkScanRoute extends _i11.PageRouteInfo<BulkScanRouteArgs> {
  BulkScanRoute({
    required _i13.QRScanBloc qrScanBloc,
    bool firstTimeScan = true,
    _i12.Key? key,
  }) : super(
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
          args: BulkScanRouteArgs(
            qrScanBloc: qrScanBloc,
            firstTimeScan: firstTimeScan,
            key: key,
          ),
        );

  static const String name = 'BulkScanRoute';
}

class BulkScanRouteArgs {
  const BulkScanRouteArgs({
    required this.qrScanBloc,
    this.firstTimeScan = true,
    this.key,
  });

  final _i13.QRScanBloc qrScanBloc;

  final bool firstTimeScan;

  final _i12.Key? key;

  @override
  String toString() {
    return 'BulkScanRouteArgs{qrScanBloc: $qrScanBloc, firstTimeScan: $firstTimeScan, key: $key}';
  }
}

/// generated route for
/// [_i4.TestDhriveScreen]
class TestDhriveRoute extends _i11.PageRouteInfo<void> {
  const TestDhriveRoute()
      : super(
          TestDhriveRoute.name,
          path: '/test-dhrive-screen',
        );

  static const String name = 'TestDhriveRoute';
}

/// generated route for
/// [_i5.HistoryScreen]
class HistoryRoute extends _i11.PageRouteInfo<void> {
  const HistoryRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          path: '/history-screen',
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [_i6.SingleScanScreen]
class SingleScanRoute extends _i11.PageRouteInfo<void> {
  const SingleScanRoute()
      : super(
          SingleScanRoute.name,
          path: '/single-scan-screen',
        );

  static const String name = 'SingleScanRoute';
}

/// generated route for
/// [_i7.RiwayatSuratJalanScreen]
class RiwayatSuratJalanRoute extends _i11.PageRouteInfo<void> {
  const RiwayatSuratJalanRoute()
      : super(
          RiwayatSuratJalanRoute.name,
          path: '/riwayat-surat-jalan-screen',
        );

  static const String name = 'RiwayatSuratJalanRoute';
}

/// generated route for
/// [_i8.AllHistoryScreen]
class AllHistoryRoute extends _i11.PageRouteInfo<void> {
  const AllHistoryRoute()
      : super(
          AllHistoryRoute.name,
          path: '',
        );

  static const String name = 'AllHistoryRoute';
}

/// generated route for
/// [_i9.UsersHistoryScreen]
class UsersHistoryRoute extends _i11.PageRouteInfo<void> {
  const UsersHistoryRoute()
      : super(
          UsersHistoryRoute.name,
          path: 'users-history-screen',
        );

  static const String name = 'UsersHistoryRoute';
}

/// generated route for
/// [_i10.DusHistoryScreen]
class DusHistoryRoute extends _i11.PageRouteInfo<void> {
  const DusHistoryRoute()
      : super(
          DusHistoryRoute.name,
          path: 'dus-history-screen',
        );

  static const String name = 'DusHistoryRoute';
}
