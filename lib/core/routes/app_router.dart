import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/presentation/pages/home_screen.dart';
import 'package:bwa_distribution_tracking/presentation/pages/login_screen.dart';
import 'package:bwa_distribution_tracking/presentation/pages/scan_result_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ScanResultScreen),
  ],
)
class $AppRouter {}
