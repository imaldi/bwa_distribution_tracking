import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/resources/gradients/basic_linear_gradient.dart';
import '../widgets/text_form_field/no_underline_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: basicLinearGradient()),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/bwa_logo.png"),
                  const CustomText(
                    "TRACKING",
                    color: Colors.white,
                    size: sizeBig + sizeMedium,
                    weight: FontWeight.w400,
                    letterSpacing: 6.0,
                  ),
                  const CustomText(
                    "Selamat Datang",
                    color: Colors.white,
                    size: sizeBig,
                    weight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                  const CustomText(
                    "Log in di bawah untuk akses akun anda",
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.grey,
                          padding: const EdgeInsets.all(sizeBig),
                          child: Form(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                'No HP',
                                color: Colors.white,
                              ),
                              RoundedContainer(
                                sizeNormal,
                                child: NoUnderlineTextFormField(
                                  onTap: () {},
                                  decoration: const InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xFFC5C5C5), fontStyle: FontStyle.italic),
                                      hintText: "Masukkan No Hp"),
                                ),
                              ),
                              const CustomText(
                                'Password',
                                color: Colors.white,
                              ),
                              RoundedContainer(
                                sizeNormal,
                                child: NoUnderlineTextFormField(
                                  onTap: () {},
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintStyle:
                                      TextStyle(color: Color(0xFFC5C5C5), fontStyle: FontStyle.italic),
                                      hintText: "Masukkan Password"),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: sizeMedium),
                                      child: ElevatedButton(
                                          onPressed: (){
                                            context.router.push(const HomeRoute());
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            side: BorderSide.none,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizeNormal)),
                                          ),
                                          child: const Text("Log In",
                                              style: TextStyle(color: Color(0xFF009DDD))
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: sizeNormal),
                                  child: const Divider(
                                    color: Colors.white,
                                    thickness: 1.5,
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomText(
                                    "Don't have an account? ",
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Sign Up Hoi");
                                    },
                                    child: const CustomText(
                                      "Sign Up",
                                      shadows: [
                                        Shadow(
                                            color: Colors.white,
                                            offset: Offset(0, -1))
                                      ],
                                      color: Colors.transparent,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
