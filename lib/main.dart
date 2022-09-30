import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

/// Entry Point
void main() async {
  await di.init();
  runApp(RootWidget());
}

/// Root Widget
class RootWidget extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  // final _appRouter = AppRouter();

  RootWidget({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: MaterialApp
          // .router
        (
        // routerDelegate: _appRouter.delegate(),
        // routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'BWA Distribution Tracking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,

            /// Mengubah font global menjadi 'Poppins'
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

            /// Mengubah padding Text Form Field menjadi default bernilai 0
            inputDecorationTheme: const InputDecorationTheme(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            )),

        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: const LoginScreen(),
      ),
    );
  }
}
