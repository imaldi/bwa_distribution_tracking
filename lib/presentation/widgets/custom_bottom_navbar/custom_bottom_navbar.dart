import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../../../core/resources/media_query/media_query_helpers.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../state_management/blocs/auth/auth_bloc.dart';

class CustomBottomNavbar extends StatefulWidget {
  final int activeIndex;
  const CustomBottomNavbar({required this.activeIndex, Key? key})
      : super(key: key);

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      /// Fixme for landscape orientation
      onTap: (index) {
        // myToast("index: $index");
        if (index == 0) {
          context.read<AuthBloc>().add(const UserLogoutAuthEvent());
        }
        if (index == 2) {
          context.router.replace(HomeRoute());
        }
        if (index == 3) {
          context.router
              .replace(RiwayatSuratJalanRoute(isRedirectDetailRiwayat: true));
        }
      },
      height: heightScreen(context) / 12,
      curveSize: 0,
      style: TabStyle.fixedCircle,
      backgroundColor: Colors.white,
      color: Colors.grey,
      elevation: 2,
      activeColor: primaryGreen,
      // initialActiveIndex: widget.activeIndex,
      items: [
        TabItem(
          title: "Logout",
          icon: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, state) {
              if (state is AuthLoggedOut) {
                context.router.replace(const LoginRoute());
              }
            },
            builder: (context, state) {
              return Icon(Icons.logout);
            },
          ),
          isIconBlend: true,
        ),
        const TabItem(
          title: "Notifikasi",
          icon: Icon(Icons.notifications_active_outlined),
          isIconBlend: true,
        ),
        TabItem(
          icon:
              // UnconstrainedBox(child: SizedBox(height: sizeMedium,width: sizeMedium,child: Container(color: Colors.white,),)),
              UnconstrainedBox(
                  child: SvgPicture.asset(
            "assets/images/home_icon_outlined.svg",
            width: sizeBig,
            height: sizeBig,
          )),
          // FloatingActionButton(
          //     backgroundColor: primaryColor,
          //     onPressed:null,elevation:0,child: SvgPicture.asset("assets/images/home_icon_outlined.svg")),
          isIconBlend: true,
        ),
        const TabItem(
          title: "Riwayat",
          icon: Icon(Icons.history),
          isIconBlend: true,
        ),
        const TabItem(
          title: "Profile",
          icon: Icon(Icons.person_outline),
          isIconBlend: true,
        ),
      ],
    );
  }
}
