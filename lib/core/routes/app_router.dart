import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/presentation/pages/home_screen.dart';
import 'package:bwa_distribution_tracking/presentation/pages/login_screen.dart';

/// sementara ga usah pakai Auto Router dulu

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
  ],
)
class $AppRouter {}
