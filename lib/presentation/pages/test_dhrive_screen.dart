import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text_form_field/no_underline_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TestDhriveScreen extends StatefulWidget {
  const TestDhriveScreen({Key? key}) : super(key: key);

  @override
  State<TestDhriveScreen> createState() => _TestDhriveScreenState();
}

class _TestDhriveScreenState extends State<TestDhriveScreen> {
  late Position position;
  String text = "";
  @override
  void initState() {
    super.initState();
    // var userModelImpl = const UserModelFreezedHive(firstName: "majideeee", lastName: "hmmm",age: 3);
    // var userModel2 = userModelImpl.rebuild((p1) => p1..name = "majidun");
    // sl<Box<UserModelFreezedHive>>().put("some user class", userModelImpl);
    // sl<Box<NormalDataClass>>().put("some data class", NormalDataClass(name: "Aldi Majid", country: "Brunei"));\
    setState(() {
      _callDeterminPosition();

    });
  }

  _callDeterminPosition() async{
    position = await _determinePosition();
    text = "Lat: ${position.latitude.toString()}, Long: ${position.longitude.toString()}";
    print("LATITUDE: $text");
  }
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hoi hoi hoi"),
        RoundedContainer(sizeNormal,
            boxDecoration: BoxDecoration(border: Border.all(color: primaryGreen)),
            child: NoUnderlineTextFormField(controller: TextEditingController(text: text),)),
      ],
    )
    // ${
        // sl<Box<UserModelFreezedHive>>().get("some user class")?.firstName
        // sl<Box<NormalDataClass>>().get("some data class")?.name
      // }"
    ),);
  }
}
