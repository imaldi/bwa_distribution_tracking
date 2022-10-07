import 'package:bwa_distribution_tracking/data/models/normal_data_class.dart';
import 'package:bwa_distribution_tracking/data/models/user_model.dart';
import 'package:bwa_distribution_tracking/data/models/user_model_freezed_hive.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TestDhriveScreen extends StatefulWidget {
  const TestDhriveScreen({Key? key}) : super(key: key);

  @override
  State<TestDhriveScreen> createState() => _TestDhriveScreenState();
}

class _TestDhriveScreenState extends State<TestDhriveScreen> {
  @override
  void initState() {
    super.initState();
    // var userModelImpl = const UserModelFreezedHive(firstName: "majideeee", lastName: "hmmm",age: 3);
    // var userModel2 = userModelImpl.rebuild((p1) => p1..name = "majidun");
    // sl<Box<UserModelFreezedHive>>().put("some user class", userModelImpl);
    // sl<Box<NormalDataClass>>().put("some data class", NormalDataClass(name: "Aldi Majid", country: "Brunei"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Text("Hoi hoi hoi ${
        sl<Box<UserModelFreezedHive>>().get("some user class")?.firstName
        // sl<Box<NormalDataClass>>().get("some data class")?.name
      }"
    ),),);
  }
}
