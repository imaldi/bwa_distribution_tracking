import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/presentation/pages/bulk_scan_screen.dart';
import 'package:bwa_distribution_tracking/presentation/pages/home_screen.dart';
import 'package:bwa_distribution_tracking/presentation/pages/login_screen.dart';
import 'package:bwa_distribution_tracking/presentation/pages/test_dhrive_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: BulkScanScreen),
    AutoRoute(page: TestDhriveScreen),
  ],
)
class $AppRouter {}
