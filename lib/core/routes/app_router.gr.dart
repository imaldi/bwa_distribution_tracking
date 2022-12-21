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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../presentation/screens/bulk_scan_screen.dart' as _i3;
import '../../presentation/screens/detail_pengiriman_screen.dart' as _i8;
import '../../presentation/screens/history_children_screen/all_history_screen.dart'
    as _i9;
import '../../presentation/screens/history_children_screen/dus_history_screen.dart'
    as _i11;
import '../../presentation/screens/history_children_screen/users_history_screen.dart'
    as _i10;
import '../../presentation/screens/history_screen.dart' as _i5;
import '../../presentation/screens/home_screen.dart' as _i2;
import '../../presentation/screens/login_screen.dart' as _i1;
import '../../presentation/screens/riwayat_surat_jalan_screen.dart' as _i7;
import '../../presentation/screens/single_scan_screen.dart' as _i6;
import '../../presentation/screens/test_dhrive_screen.dart' as _i4;
import '../../presentation/state_management/blocs/scan/qr_scan_bloc.dart'
    as _i14;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i2.HomeScreen()),
      );
    },
    BulkScanRoute.name: (routeData) {
      final args = routeData.argsAs<BulkScanRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i3.BulkScanScreen(
          qrScanBloc: args.qrScanBloc,
          firstTimeScan: args.firstTimeScan,
          qrCode: args.qrCode,
          key: args.key,
        )),
      );
    },
    TestDhriveRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TestDhriveScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i5.HistoryScreen()),
      );
    },
    SingleScanRoute.name: (routeData) {
      final args = routeData.argsAs<SingleScanRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i6.SingleScanScreen(
          qrcodeSj: args.qrcodeSj,
          key: args.key,
        )),
      );
    },
    RiwayatSuratJalanRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RiwayatSuratJalanScreen(),
      );
    },
    DetailPengirimanRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DetailPengirimanScreen(),
      );
    },
    AllHistoryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AllHistoryScreen(),
      );
    },
    UsersHistoryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.UsersHistoryScreen(),
      );
    },
    DusHistoryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.DusHistoryScreen(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          HomeRoute.name,
          path: '/home-screen',
        ),
        _i12.RouteConfig(
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
        ),
        _i12.RouteConfig(
          TestDhriveRoute.name,
          path: '/test-dhrive-screen',
        ),
        _i12.RouteConfig(
          HistoryRoute.name,
          path: '/history-screen',
          children: [
            _i12.RouteConfig(
              AllHistoryRoute.name,
              path: '',
              parent: HistoryRoute.name,
            ),
            _i12.RouteConfig(
              UsersHistoryRoute.name,
              path: 'users-history-screen',
              parent: HistoryRoute.name,
            ),
            _i12.RouteConfig(
              DusHistoryRoute.name,
              path: 'dus-history-screen',
              parent: HistoryRoute.name,
            ),
          ],
        ),
        _i12.RouteConfig(
          SingleScanRoute.name,
          path: '/single-scan-screen',
        ),
        _i12.RouteConfig(
          RiwayatSuratJalanRoute.name,
          path: '/riwayat-surat-jalan-screen',
        ),
        _i12.RouteConfig(
          DetailPengirimanRoute.name,
          path: '/detail-pengiriman-screen',
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BulkScanScreen]
class BulkScanRoute extends _i12.PageRouteInfo<BulkScanRouteArgs> {
  BulkScanRoute({
    required _i14.QRScanBloc qrScanBloc,
    bool firstTimeScan = true,
    required String qrCode,
    _i13.Key? key,
  }) : super(
          BulkScanRoute.name,
          path: '/bulk-scan-screen',
          args: BulkScanRouteArgs(
            qrScanBloc: qrScanBloc,
            firstTimeScan: firstTimeScan,
            qrCode: qrCode,
            key: key,
          ),
        );

  static const String name = 'BulkScanRoute';
}

class BulkScanRouteArgs {
  const BulkScanRouteArgs({
    required this.qrScanBloc,
    this.firstTimeScan = true,
    required this.qrCode,
    this.key,
  });

  final _i14.QRScanBloc qrScanBloc;

  final bool firstTimeScan;

  final String qrCode;

  final _i13.Key? key;

  @override
  String toString() {
    return 'BulkScanRouteArgs{qrScanBloc: $qrScanBloc, firstTimeScan: $firstTimeScan, qrCode: $qrCode, key: $key}';
  }
}

/// generated route for
/// [_i4.TestDhriveScreen]
class TestDhriveRoute extends _i12.PageRouteInfo<void> {
  const TestDhriveRoute()
      : super(
          TestDhriveRoute.name,
          path: '/test-dhrive-screen',
        );

  static const String name = 'TestDhriveRoute';
}

/// generated route for
/// [_i5.HistoryScreen]
class HistoryRoute extends _i12.PageRouteInfo<void> {
  const HistoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          path: '/history-screen',
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [_i6.SingleScanScreen]
class SingleScanRoute extends _i12.PageRouteInfo<SingleScanRouteArgs> {
  SingleScanRoute({
    required String qrcodeSj,
    _i13.Key? key,
  }) : super(
          SingleScanRoute.name,
          path: '/single-scan-screen',
          args: SingleScanRouteArgs(
            qrcodeSj: qrcodeSj,
            key: key,
          ),
        );

  static const String name = 'SingleScanRoute';
}

class SingleScanRouteArgs {
  const SingleScanRouteArgs({
    required this.qrcodeSj,
    this.key,
  });

  final String qrcodeSj;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SingleScanRouteArgs{qrcodeSj: $qrcodeSj, key: $key}';
  }
}

/// generated route for
/// [_i7.RiwayatSuratJalanScreen]
class RiwayatSuratJalanRoute extends _i12.PageRouteInfo<void> {
  const RiwayatSuratJalanRoute()
      : super(
          RiwayatSuratJalanRoute.name,
          path: '/riwayat-surat-jalan-screen',
        );

  static const String name = 'RiwayatSuratJalanRoute';
}

/// generated route for
/// [_i8.DetailPengirimanScreen]
class DetailPengirimanRoute extends _i12.PageRouteInfo<void> {
  const DetailPengirimanRoute()
      : super(
          DetailPengirimanRoute.name,
          path: '/detail-pengiriman-screen',
        );

  static const String name = 'DetailPengirimanRoute';
}

/// generated route for
/// [_i9.AllHistoryScreen]
class AllHistoryRoute extends _i12.PageRouteInfo<void> {
  const AllHistoryRoute()
      : super(
          AllHistoryRoute.name,
          path: '',
        );

  static const String name = 'AllHistoryRoute';
}

/// generated route for
/// [_i10.UsersHistoryScreen]
class UsersHistoryRoute extends _i12.PageRouteInfo<void> {
  const UsersHistoryRoute()
      : super(
          UsersHistoryRoute.name,
          path: 'users-history-screen',
        );

  static const String name = 'UsersHistoryRoute';
}

/// generated route for
/// [_i11.DusHistoryScreen]
class DusHistoryRoute extends _i12.PageRouteInfo<void> {
  const DusHistoryRoute()
      : super(
          DusHistoryRoute.name,
          path: 'dus-history-screen',
        );

  static const String name = 'DusHistoryRoute';
}
