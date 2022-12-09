import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/internet_connection/internet_connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

/// Entry Point
void main() async {
  /// DI Init
  /// TODO use Injectable later
  await di.init();
  runApp(RootWidget());
}

/// Root Widget
class RootWidget extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  RootWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<InternetConnectionCubit>()),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'BWA Distribution Tracking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryGreen,
            // primarySwatch: customPrimaryMaterialColor,
            appBarTheme: AppBarTheme.of(context).copyWith(
              backgroundColor: primaryGreen,
            ),

            /// Mengubah font global menjadi 'Poppins'
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

            /// Mengubah padding Text Form Field menjadi default bernilai 0
            inputDecorationTheme: const InputDecorationTheme(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            )),

        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: const LoginScreen(),
      ),
    );
  }
}
