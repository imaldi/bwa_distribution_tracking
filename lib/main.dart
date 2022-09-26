import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BWA Distribution Tracking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        /// Mengubah font global menjadi 'Poppins'
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ),
        /// Mengubah padding Text Form Field menjadi default bernilai 0
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        )
      ),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const LoginPage(),
    );
  }
}