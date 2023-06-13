import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text_form_field/no_underline_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/models/wilayah_indonesia_api/kabupaten_kota_model.dart';
import '../../data/models/wilayah_indonesia_api/kecamatan_model.dart';
import '../../data/models/wilayah_indonesia_api/kelurahan_model.dart';
import '../../data/models/wilayah_indonesia_api/province_model.dart';
import '../../injection_container.dart';
import '../state_management/cubits/wilayah_indonesia/wilayah_indonesia_cubit.dart';
import '../widgets/my_dropdown_button/my_dropdown_button.dart';

class TestDhriveScreen extends StatefulWidget implements AutoRouteWrapper {
  const TestDhriveScreen({Key? key}) : super(key: key);

  @override
  State<TestDhriveScreen> createState() => _TestDhriveScreenState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return
        // Fixme harusnya location bikin cubit sendiri, jangan coupled sama BulkScanScreenCubit
        MultiBlocProvider(providers: [
      BlocProvider.value(value: sl<WilayahIndonesiaCubit>()),
    ], child: this);
  }
}

class _TestDhriveScreenState extends State<TestDhriveScreen> {
  late Position position;
  String text = "";
  final provinsiDropdownKey = GlobalKey<FormState>();
  final kabupatenDropdownKey = GlobalKey<FormState>();
  final kecamatanDropdownKey = GlobalKey<FormState>();
  final kelurahanDropdownKey = GlobalKey<FormState>();
  final listKey = <GlobalKey<FormState>>[];

  @override
  void initState() {
    super.initState();
    listKey.addAll([
      provinsiDropdownKey,
      kabupatenDropdownKey,
      kecamatanDropdownKey,
      kelurahanDropdownKey,
    ]);
    context.read<WilayahIndonesiaCubit>().initProvince();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hoi hoi hoi"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: sizeNormal),
            child: Builder(builder: (context) {
              var provinceResp =
                  context.watch<WilayahIndonesiaCubit>().state.provinceResponse;
              var provinceList = (provinceResp ?? <ProvinceResponse>[])
                  .map((e) => e.name ?? "null")
                  .toList();
              // print("provinceList: $provinceList");
              // print("provinceResp: $provinceResp");

              return MyDropdownButton<String>(
                // ["Dropship", "Pengiriman"]
                []..addAll(provinceList),
                (v) => v,
                formKey: provinsiDropdownKey,
                onItemTapped: (val) {
                  context.read<WilayahIndonesiaCubit>().fetchKabupaten(
                      int.parse(provinceResp
                              ?.firstWhere((element) => element.name == val)
                              .id ??
                          "0"));
                  // cubit.updateStoreSelesaiResponse(
                  //     (p0) => p0.copyWith(provinsi: val));
                },
                validator: (val) {
                  if (val == null) return "Wajib Isi";
                  return null;
                },
                hint: const Text(
                  "Provinsi",
                  style: TextStyle(color: primaryGreen),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: sizeNormal),
            child: Builder(builder: (context) {
              var resp = context
                  .watch<WilayahIndonesiaCubit>()
                  .state
                  .kabupatenKotaResponse;
              var theList = (resp ?? <KabupatenKotaResponse>[])
                  .map((e) => e.name ?? "null")
                  .toList();
              print("kab/kota: $resp");
              print("kan/kota list: $theList");

              return MyDropdownButton<String>(
                // ["Dropship", "Pengiriman"]
                []..addAll(theList),
                (v) => v,
                formKey: kabupatenDropdownKey,
                onItemTapped: (val) {
                  context.read<WilayahIndonesiaCubit>().fetchKecamatan(
                      int.parse(resp
                              ?.firstWhere((element) => element.name == val)
                              .id ??
                          "0"));
                  // cubit.updateStoreSelesaiResponse(
                  //     (p0) => p0.copyWith(kabupaten: val));
                },
                validator: (val) {
                  if (val == null) return "Wajib Isi";
                  return null;
                },
                hint: const Text(
                  "Kabupaten / Kota",
                  style: TextStyle(color: primaryGreen),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: sizeNormal),
            child: Builder(builder: (context) {
              var resp = context
                  .watch<WilayahIndonesiaCubit>()
                  .state
                  .kecamatanResponse;
              var theList = (resp ?? <KecamatanResponse>[])
                  .map((e) => e.name ?? "null")
                  .toList();
              print("resp: $resp");
              print("list: $theList");

              return MyDropdownButton<String>(
                // ["Dropship", "Pengiriman"]
                []..addAll(theList),
                (v) => v,
                formKey: kecamatanDropdownKey,
                onItemTapped: (val) {
                  context.read<WilayahIndonesiaCubit>().fetchKelurahan(
                      int.parse(resp
                              ?.firstWhere((element) => element.name == val)
                              .id ??
                          "0"));
                  // cubit.updateStoreSelesaiResponse(
                  //     (p0) => p0.copyWith(kecamatan: val));
                },
                validator: (val) {
                  if (val == null) return "Wajib Isi";
                  return null;
                },
                hint: const Text(
                  "Kecamatan",
                  style: TextStyle(color: primaryGreen),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: sizeNormal),
            child: Builder(builder: (context) {
              var resp = context
                  .watch<WilayahIndonesiaCubit>()
                  .state
                  .kelurahanResponse;
              var theList = (resp ?? <KelurahanResponse>[])
                  .map((e) => e.name ?? "null")
                  .toList();
              // print("resp: $resp");
              // print("resp list: $theList");

              return MyDropdownButton<String>(
                // ["Dropship", "Pengiriman"]
                []..addAll(theList),
                (v) => v,
                formKey: kelurahanDropdownKey,
                onItemTapped: (val) {
                  // cubit.updateStoreSelesaiResponse(
                  //     (p0) => p0.copyWith(kelurahan: val));
                },
                validator: (val) {
                  if (val == null) return "Wajib Isi";
                  return null;
                },
                hint: const Text(
                  "Kelurahan",
                  style: TextStyle(color: primaryGreen),
                ),
              );
            }),
          ),
        ],
      )),
    );
  }
}
