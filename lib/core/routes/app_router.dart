import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/presentation/screens/bulk_scan_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/history_children_screen/all_history_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/history_children_screen/dus_history_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/history_children_screen/users_history_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/history_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/home_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/login_screen.dart';
import 'package:bwa_distribution_tracking/presentation/screens/test_dhrive_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: BulkScanScreen),
    AutoRoute(page: TestDhriveScreen),
    AutoRoute(page: HistoryScreen,
    children: [
      AutoRoute(page: AllHistoryScreen, initial: true),
      AutoRoute(page: UsersHistoryScreen),
      AutoRoute(page: DusHistoryScreen),
    ]
    ),
  ],
)
class $AppRouter {}
