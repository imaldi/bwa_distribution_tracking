import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kabupaten_kota_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kecamatan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kelurahan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/province_model.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/single_scan_screen_bloc/single_scan_screen_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/single_scan_screen/single_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/wilayah_indonesia/wilayah_indonesia_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_dropdown_button/my_dropdown_button.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/resources/consts/sizes.dart';
import '../../core/resources/helper/file_compressor.dart';
import '../../injection_container.dart';
import '../state_management/cubits/bulk_scan/bulk_scan_screen_cubit.dart';
import '../widgets/container/rounded_container.dart';
import '../widgets/custom_appbar_container/custom_appbar_container.dart';
import '../widgets/my_text_field/my_text_field.dart';
import '../widgets/scan_dus_and_choose_picture_widget/scan_dus_and_choose_picture_widget.dart';
import '../widgets/text/custom_text.dart';

class SingleScanScreen extends StatefulWidget implements AutoRouteWrapper {
  final String qrcodeSj;

  const SingleScanScreen({required this.qrcodeSj, super.key});

  @override
  State<StatefulWidget> createState() => _SingleScanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return
        // Fixme harusnya location bikin cubit sendiri, jangan coupled sama BulkScanScreenCubit
        MultiBlocProvider(providers: [
      BlocProvider.value(value: sl<BulkScanScreenCubit>()),
      BlocProvider.value(value: sl<SingleScanScreenCubit>()),
      BlocProvider.value(value: sl<WilayahIndonesiaCubit>()),
      BlocProvider.value(value: sl<SingleScanScreenBloc>()),
    ], child: this);
  }
}

class _SingleScanScreenState extends State<SingleScanScreen> {
  var controller = ScrollController();
  final formKey = GlobalKey<FormState>();
  final dropdownKey = GlobalKey<FormState>();
  final namaPnrmaCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  final lembagaCtrl = TextEditingController();
  final tmptTjnCtrl = TextEditingController();
  final dtailAlamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // get coordinate, after done, update screen cubit state with the location data
    context.read<BulkScanScreenCubit>().getCurrentCoordinateAndAddress(
        callBackAfterFetchLocation: (lat, lng, addres) {
      context.read<SingleScanScreenCubit>().updateStoreSelesaiResponse((p0) =>
          p0.copyWith(
              qrcodeSj: widget.qrcodeSj, latitude: lat, longtitude: lng));
    });
    // get list of province from api
    context.read<WilayahIndonesiaCubit>().initProvince();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Single Scan"),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              CustomAppbarContainer(
                  titleText: "Single Scan",
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: sizeNormal, vertical: sizeMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "Petugas",
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        // Fixme pakai data user disini
                        CustomText(
                          "Mamat Untung",
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
              BlocBuilder<SingleScanScreenCubit, SingleScanScreenCubitState>(
                  builder: (context, state) {
                var cubit = context.read<SingleScanScreenCubit>();
                var storeSelesaiState =
                    // context
                    // .watch<SingleScanScreenCubit>()
                    // .
                    state.storeSelesaiResponse;
                return Form(
                  key: formKey,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: sizeHuge * 2,
                      left: sizeMedium,
                      top: sizeMedium,
                      right: sizeMedium,
                    ),
                    child: Column(
                      children: [
                        MyTextField(
                          label: 'Nama Penerima',
                          controller: namaPnrmaCtrl,
                          onChanged: (val) {
                            cubit.updateStoreSelesaiResponse(
                                (p0) => p0.copyWith(namaPenerima: val));
                            // Fixme kenapa kalau di Toast, statenya ga langsung kebaca perubahannya??
                            // mungkin karena toast harusnya di listener???
                            // ya, memang harus pakai listener dan pakai "state" dari closure/lambda nya listener
                          },
                        ),
                        MyTextField(
                            label: 'No Hp',
                            keyboardType: TextInputType.phone,
                            controller: noHpCtrl,
                            onChanged: (val) {
                              cubit.updateStoreSelesaiResponse(
                                  (p0) => p0.copyWith(noHp: val));
                            }),

                        // Fixme (Tidak ada field di JSON)
                        MyTextField(
                            label: 'Nama Lembaga',
                            controller: lembagaCtrl,
                            onChanged: (val) {
                              cubit.updateStoreSelesaiResponse(
                                  (p0) => p0.copyWith(lembaga: val));
                            }),
                        // Fixme tidak tau field di JSON
                        MyTextField(
                            label: 'Tempat Tujuan',
                            controller: tmptTjnCtrl,
                            onChanged: (val) {
                              cubit.updateStoreSelesaiResponse(
                                  (p0) => p0.copyWith(nmTempat: val));
                            }),
                        // Fixme lebih dari 1 baris (freetext)
                        MyTextField(
                            label: 'Detail Alamat',
                            controller: dtailAlamatCtrl,
                            onChanged: (val) {
                              cubit.updateStoreSelesaiResponse(
                                  (p0) => p0.copyWith(detailTempat: val));
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: sizeNormal),
                          child: Builder(
                            builder: (context) {
                              var provinceResp = context.watch<WilayahIndonesiaCubit>().state.provinceResponse;
                              var provinceList = (provinceResp ?? <ProvinceResponse>[]).map((e) => e.name ?? "null").toList();
                              print("provinceList: $provinceList");
                              print("provinceResp: $provinceResp");

                              return MyDropdownButton<String>(
                                // ["Dropship", "Pengiriman"]
                                []..addAll(provinceList)
                                ,
                                    (v) => v,
                                onItemTapped: (val) {
                                  context
                                      .read<WilayahIndonesiaCubit>()
                                      .fetchKabupaten(int.parse(provinceResp?.firstWhere((element) => element.name == val).id ?? "0"));
                                  cubit.updateStoreSelesaiResponse(
                                          (p0) => p0.copyWith(provinsi: val));
                                },
                                hint: const Text(
                                  "Provinsi",
                                  style: TextStyle(color: primaryGreen),
                                ),
                              );
                            }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: sizeNormal),
                          child: Builder(
                              builder: (context) {
                                var resp = context.watch<WilayahIndonesiaCubit>().state.kabupatenKotaResponse;
                                var theList = (resp ?? <KabupatenKotaResponse>[]).map((e) => e.name ?? "null").toList();
                                print("kab/kota: $resp");
                                print("kan/kota list: $theList");

                                return MyDropdownButton<String>(
                                  // ["Dropship", "Pengiriman"]
                                  []..addAll(theList),
                                      (v) => v,
                                  onItemTapped: (val) {
                                    context
                                        .read<WilayahIndonesiaCubit>()
                                        .fetchKecamatan(int.parse(resp?.firstWhere((element) => element.name == val).id ?? "0"));
                                    cubit.updateStoreSelesaiResponse(
                                            (p0) => p0.copyWith(kabupaten: val));
                                  },
                                  hint: const Text(
                                    "Kabupaten / Kota",
                                    style: TextStyle(color: primaryGreen),
                                  ),
                                );
                              }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: sizeNormal),
                          child: Builder(
                              builder: (context) {
                                var resp = context.watch<WilayahIndonesiaCubit>().state.kecamatanResponse;
                                var theList = (resp ?? <KecamatanResponse>[]).map((e) => e.name ?? "null").toList();
                                print("resp: $resp");
                                print("list: $theList");

                                return MyDropdownButton<String>(
                                  // ["Dropship", "Pengiriman"]
                                  []..addAll(theList),
                                      (v) => v,
                                  onItemTapped: (val) {
                                    context
                                        .read<WilayahIndonesiaCubit>()
                                        .fetchKelurahan(int.parse(resp?.firstWhere((element) => element.name == val).id ?? "0"));
                                    cubit.updateStoreSelesaiResponse(
                                            (p0) => p0.copyWith(kecamatan: val));
                                  },
                                  hint: const Text(
                                    "Kecamatan",
                                    style: TextStyle(color: primaryGreen),
                                  ),
                                );
                              }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: sizeNormal),
                          child: Builder(
                              builder: (context) {
                                var resp = context.watch<WilayahIndonesiaCubit>().state.kelurahanResponse;
                                var theList = (resp ?? <KelurahanResponse>[]).map((e) => e.name ?? "null").toList();
                                print("resp: $resp");
                                print("resp list: $theList");

                                return MyDropdownButton<String>(
                                  // ["Dropship", "Pengiriman"]
                                  []..addAll(theList),
                                      (v) => v,
                                  onItemTapped: (val) {
                                    cubit.updateStoreSelesaiResponse(
                                            (p0) => p0.copyWith(kelurahan: val));
                                  },
                                  hint: const Text(
                                    "Kelurahan",
                                    style: TextStyle(color: primaryGreen),
                                  ),
                                );
                              }
                          ),
                        ),

                        // Fixme lebih dari satu baris
                        Builder(builder: (context) {
                          var state = context
                              .watch<BulkScanScreenCubit>()
                              .state
                              .address;
                          return MyTextField(
                            enabled: false,
                            label: 'Google Address',
                            controller: TextEditingController(text: state),
                          );
                        }),
                        MyDropdownButton<String>(
                          const ["Dikirim", "Sampai"],
                          (v) => v,
                          formKey: dropdownKey,
                          value: storeSelesaiState?.header?.statusPengiriman,
                          hint: const CustomText("Status Pengiriman",
                              color: primaryGreen),
                          margin:
                              const EdgeInsets.symmetric(vertical: sizeNormal),
                          onItemTapped: (val) {
                            cubit.updateStoreSelesaiResponse(
                                (p0) => p0.copyWith(statusPengiriman: val));
                          },
                          validator: (val) {
                            if (val == null) return "Wajib Isi Woi";
                            return null;
                          },
                        ),
                        ScanDusAndChoosePictureWidget(functionCallbackSetImageFilePath:(qrCode, theFile){

                        }),
                        Container(
                          height: 200,
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.only(bottom: sizeBig),
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              // gradient: basicDiagonalGradient(),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(sizeMedium))),
                          child: NotificationListener<OverscrollNotification>(
                            onNotification: (OverscrollNotification value) {
                              if (value.overscroll < 0 &&
                                  controller.offset + value.overscroll <= 0) {
                                if (controller.offset != 0)
                                  controller.jumpTo(0);
                                return true;
                              }
                              if (controller.offset + value.overscroll >=
                                  controller.position.maxScrollExtent) {
                                if (controller.offset !=
                                    controller.position.maxScrollExtent) {
                                  controller.jumpTo(
                                      controller.position.maxScrollExtent);
                                }
                                return true;
                              }
                              controller
                                  .jumpTo(controller.offset + value.overscroll);
                              return true;
                            },
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              // padding: const EdgeInsets.all(sizeNormal),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 15,
                              itemBuilder: (cont, ind) {
                                return Container(
                                  color:
                                      ind % 2 == 0 ? null : primaryDarkerColor,
                                  child: ListTile(
                                      title: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: FittedBox(
                                        child: CustomText(
                                      "$ind No Dus: 003SJPJ22 - MERANTI00098-0002-$ind",
                                      color: Colors.white,
                                    )),
                                  )),
                                );
                              },
                            ),
                          ),
                        ),

                        BlocListener<SingleScanScreenCubit,
                            SingleScanScreenCubitState>(
                          listener: (context, state) {
                            // myToast("Image Path: ${state.storeSelesaiResponse?.header?.foto.toString()}");
                            myToast("Success Choosing Image");
                          },
                          listenWhen: (before, after) {
                            return before.storeSelesaiResponse?.header?.foto !=
                                after.storeSelesaiResponse?.header?.foto;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: InkWell(
                                  onTap: () async {
                                    File? storedImage;

                                    ImagePicker imagePicker = ImagePicker();

                                    XFile? pickedFile = await imagePicker
                                        .pickImage(source: ImageSource.gallery)
                                        .whenComplete(() {});

                                    // myToast("pickedFile path : ${pickedFile?.path}");

                                    storedImage = File(pickedFile?.path ?? "");
                                    storedImage =
                                        await fileCompressor(storedImage);
                                    // Fixme benerin tentang context ini
                                    context
                                        .read<SingleScanScreenCubit>()
                                        .updateStoreSelesaiResponse((x) =>
                                            x.copyWith(
                                                foto: storedImage?.path ?? ""));
                                    // theImage?.path ?? "");
                                  },
                                  child: RoundedContainer(sizeNormal,
                                      constraints: const BoxConstraints(
                                          minWidth: sizeHuge + 30),
                                      boxDecoration: const BoxDecoration(
                                          color: primaryGreen),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.upload,
                                            color: Colors.white,
                                            size: sizeHuge,
                                          ),
                                          FittedBox(
                                              child: CustomText(
                                            "Upload",
                                            color: Colors.white,
                                          )),
                                        ],
                                      )),
                                ),
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () async {
                                    File? storedImage;

                                    // myToast("Take Foto");
                                    ImagePicker imagePicker = ImagePicker();

                                    XFile? pickedFile = await imagePicker
                                        .pickImage(source: ImageSource.camera)
                                        .whenComplete(() {});

                                    // myToast("take photo path : ${pickedFile?.path}");

                                    storedImage = File(pickedFile?.path ?? "");
                                    storedImage =
                                        await fileCompressor(storedImage);
                                    // Fixme benerin tentang context ini
                                    context
                                        .read<SingleScanScreenCubit>()
                                        .updateStoreSelesaiResponse((x) =>
                                            x.copyWith(
                                                foto: storedImage?.path ?? ""));
                                    // theImage?.path ?? "");
                                  },
                                  child: RoundedContainer(sizeNormal,
                                      constraints: const BoxConstraints(
                                          minWidth: sizeHuge + 30),
                                      boxDecoration: const BoxDecoration(
                                          color: primaryGreen),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                            size: sizeHuge,
                                          ),
                                          FittedBox(
                                              child: CustomText(
                                            "Take Photo",
                                            color: Colors.white,
                                          )),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: sizeMedium,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: BlocConsumer<SingleScanScreenBloc,
                                  SingleScanScreenState>(
                                listener: (contextCons, state) {
                                  myToast("State: ${state.runtimeType}");
                                  if (state is SingleScanScreenSuccess) {
                                    myToast("Success Save Data");
                                    contextCons.router
                                        .replace(const HomeRoute());
                                  }
                                },
                                builder: (ctx, s) {
                                  return ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState?.validate() ??
                                            false) {
                                          formKey.currentState?.save();
                                          if (dropdownKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            dropdownKey.currentState?.save();
                                            // TODO disini tambahkan event Bloc store selesai
                                            // Future.delayed(const Duration(milliseconds: 100),()async{
                                            context
                                                .read<SingleScanScreenBloc>()
                                                .add(SendRequesStoreSelesai(state
                                                        .storeSelesaiResponse ??
                                                    StoreSelesaiResponse()));
                                            // });
                                          } else {
                                            myToast(
                                                "Dropdown Status Pengiriman Belum Dipilih");
                                          }
                                        }

                                        // context.router
                                        //     .push(const RiwayatSuratJalanRoute());
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor),
                                      child:
                                          // const Text("Simpan"));
                                          Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: s is SingleScanScreenLoading
                                            ? FittedBox(
                                                child:
                                                    const CircularProgressIndicator(
                                                color: Colors.white,
                                              ))
                                            : const Text("Simpan"),
                                      ));
                                  // s is SingleScanScreenLoading ? const CircularProgressIndicator(color: primaryColor,): const Text("Simpan"));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
