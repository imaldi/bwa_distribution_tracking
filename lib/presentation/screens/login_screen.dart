import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../core/resources/gradients/basic_linear_gradient.dart';
import '../widgets/text_form_field/no_underline_text_form_field.dart';

class LoginScreen extends StatefulWidget
// implements AutoRouteWrapper
{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider(create: (context) =>   sl<AuthBloc>(), child: this,);
  // }
}

class _LoginScreenState extends State<LoginScreen> {
  // var phone = "08121212";
  var phone = "";
  var password = "";
  late TextEditingController phoneTEC;
  late TextEditingController passwordTEC;
  @override
  void initState() {
    super.initState();
    // pak kamal
    // phone = "081234567";
    // bambang wisnu
    // phone = "085780907168";
    // kurir 1
    phone = "08121212";

    password = "bwa123Password";
    phoneTEC = TextEditingController(text: phone);
    passwordTEC = TextEditingController(text: password);
    context.read<AuthBloc>().add(const GetCachedLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            width: widthScreen(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/images/login_background.png"),
              )
            ),

          ),

          Container(
            decoration: BoxDecoration(
                // color: Colors.transparent,
                gradient: basicLinearGradient()),
            // Ini dipertanyakan
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: sizeBig,
                        ),
                        Image.asset(
                          "assets/images/bwa_logo.png",
                          width: 100,
                        ),
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
                                        controller: phoneTEC,
                                        onTap: () {},
                                        onChanged: (val) {
                                          setState(() {
                                            phone = val;
                                          });
                                        },
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color(0xFFC5C5C5),
                                              fontStyle: FontStyle.italic),
                                          hintText: "Masukkan No Hp",
                                        ),
                                      ),
                                    ),
                                    const CustomText(
                                      'Password',
                                      color: Colors.white,
                                    ),
                                    RoundedContainer(
                                      sizeNormal,
                                      child: NoUnderlineTextFormField(
                                        controller: passwordTEC,
                                        onTap: () {},
                                        onChanged: (val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Color(0xFFC5C5C5),
                                                fontStyle: FontStyle.italic),
                                            hintText: "Masukkan Password"),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: sizeMedium),
                                            child: BlocConsumer<AuthBloc,
                                                    AuthState>(
                                                listener: (lc, state) {
                                              print(
                                                  "BlocConsumer.listener: ${state.toString()}");
                                              // Call Toast Here when Failed
                                              if (state is AuthFailed) {
                                                myToast("Gagal Login: ${state.errorMessage}");
                                              }
                                              if (state is AuthSuccess) {
                                                context.router
                                                    .replace(const HomeRoute());
                                              }
                                            }, builder: (bc, state) {

                                              if (state is AuthLoading) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    SizedBox(
                                                        child:
                                                            CircularProgressIndicator(
                                                      color: Colors.white,
                                                    )),
                                                  ],
                                                );
                                              }
                                              return ElevatedButton(
                                                  onPressed: () {
                                                    BlocProvider.of<AuthBloc>(
                                                            context)
                                                        .add(UserLoginAuthEvent(
                                                            phone, password));
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    side: BorderSide.none,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    sizeNormal)),
                                                  ),
                                                  child: const Text("Log In",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF009DDD))));
                                            }),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CustomText(
                                          "Don't have an account? ",
                                          color: Colors.white,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            myToast("Sign Up");
                                          },
                                          child: const CustomText(
                                            "Sign Up",
                                            shadows: [
                                              Shadow(
                                                  color: Colors.white,
                                                  offset: Offset(0, -1))
                                            ],
                                            color: Colors.transparent,
                                            decoration:
                                                TextDecoration.underline,
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
          ),
          ],
      ),
    ));
  }
}
