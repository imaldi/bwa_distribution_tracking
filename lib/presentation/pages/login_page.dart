import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/text_style/text_style.dart';
import 'package:bwa_distribution_tracking/core/resources/text_style/white_text_extension.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/white_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/resources/gradients/basic_linear_gradient.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Login Page"),),
        body: Container(
      // color: Colors.blue,
      decoration: BoxDecoration(gradient: basicLinearGradient()),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/bwa_logo.png"),
                const CustomText(
                  "TRACKING",
                  color: Colors.white,
                  size: sizeBig + sizeMedium,
                ),
                Text(
                  "TRACKING",
                  style: whiteText(),
                ),
                const CustomText(
                  "Selamat Datang",
                  color: Colors.white,
                  size: sizeBig,
                ),
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
