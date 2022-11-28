import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/gradients/basic_linear_gradient.dart';
import 'package:bwa_distribution_tracking/core/resources/media_query/media_query_helpers.dart';
import 'package:bwa_distribution_tracking/core/routes/app_router.gr.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/cubit/bulk_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/image_picker/my_image_picker.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_dropdown_button/my_dropdown_button.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_paginator/my_paginator.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text/custom_text.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/text_form_field/no_underline_text_form_field.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/toast/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BulkScanScreen extends StatefulWidget implements AutoRouteWrapper {
  final QRScanBloc qrScanBloc;

  const BulkScanScreen({required this.qrScanBloc, Key? key}) : super(key: key);

  @override
  State<BulkScanScreen> createState() => _BulkScanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: qrScanBloc,
        ),
        BlocProvider.value(value: sl<BulkScanScreenCubit>())
      ],
      child: this,
    );
  }
}

class _BulkScanScreenState extends State<BulkScanScreen> {
  @override
  void initState() {
    super.initState();

    context.read<BulkScanScreenCubit>().getCurrentCoordinateAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Barang"),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          var name = "";
          if (state is AuthSuccess) {
            name = state.loginResponse.user?.name ?? "";
          }

          return BlocConsumer<QRScanBloc, QRScanState>(
            listener: (context, state) {
              if (state is SendScanSuccess) {
                myToast("Send Scan Success");
                // context.router.pop();
                context.router.replace(const HistoryRoute());
              }
            },
            builder: (context, state) {
              // var response;
              if (state is QRScanLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryGreen,
                  ),
                );
              }
              if (state is QRScanFailed) {
                // response = "null";
                myToast("Mohon maaf, ada kesalahan");
                context.router.pop();
              }
              if (state is QRBulkScanSuccess) {
                // response = state.bulkScanResponse;
                var data = state.bulkScanResponse.data?.first;
                var details = state.bulkScanResponse.detail;
                var dataPerPage = details?.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(sizeMedium),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomText(
                          "NOMOR ID",
                          color: primaryGreen,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          "${data?.nosj}",
                          color: primaryGreen,
                          weight: FontWeight.bold,
                        ),
                        RoundedContainer(sizeMedium,
                            padding: const EdgeInsets.all(sizeMedium),
                            boxDecoration: const BoxDecoration(
                              color: primaryColor,
                              // gradient: basicDiagonalGradient(),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                        child: CustomText(
                                      "Tanggal",
                                      color: Colors.white,
                                    )),
                                    Expanded(
                                        child: CustomText(
                                      ": ${data?.tanggal}",
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                        child: CustomText(
                                      "Nomor PC/PO",
                                      color: Colors.white,
                                    )),
                                    Expanded(
                                        child: CustomText(
                                      ": ${data?.nopc}",
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                        child: CustomText(
                                      "No Polisi",
                                      color: Colors.white,
                                    )),
                                    Expanded(
                                        child: CustomText(
                                      ": ${data?.nopol}",
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                        child: CustomText(
                                      "Nama Ekspedisi",
                                      color: Colors.white,
                                    )),
                                    Expanded(
                                        child: CustomText(
                                      ": ${data?.dikirimBy}",
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Expanded(
                                        child: CustomText(
                                      "Nama Pengemudi",
                                      color: Colors.white,
                                    )),
                                    Expanded(
                                        child: CustomText(
                                      ": 05-09-2022",
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                        child: CustomText(
                                      "Alamat Pengirimiman",
                                      color: Colors.white,
                                    )),
                                    Expanded(
                                        child: CustomText(
                                      ": ${data?.alamat}",
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              // gradient: basicDiagonalGradient(),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(sizeMedium))),
                          child: Column(
                            children: [
                              // const CustomText("Sedang perbaikan",color: Colors.white,),

                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                // padding: const EdgeInsets.all(sizeNormal),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:
                                    state.bulkScanResponse.detail?.data?.length,
                                itemBuilder: (cont, ind) {
                                  return Container(
                                    color: ind % 2 == 0
                                        ? null
                                        : primaryDarkerColor,
                                    child: ListTile(
                                        title: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 3,
                                            child: FittedBox(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: sizeNormal),
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 2,
                                                            color:
                                                                Colors.white))),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        "Kode Batch: ${dataPerPage?[ind].kodeBatch}",
                                                        color: Colors.white),
                                                    CustomText(
                                                      "Nama Barang (Project): ${dataPerPage?[ind].nmProject}",
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: FittedBox(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: sizeNormal),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // FIXME tanyakan soal field yang benar
                                                    CustomText(
                                                        "QTY: ${dataPerPage?[ind].jmlKeluar}",
                                                        color: Colors.white),
                                                    CustomText(
                                                        "Jumlah: ${dataPerPage?[ind].jmlKeluar}",
                                                        color: Colors.white),
                                                    CustomText(
                                                        "Satuan: ${dataPerPage?[ind].jmlKeluar}",
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                          // CustomText("Kode Batch: ${details?[ind].kodeBatch}"),
                                        ],
                                      ),
                                    )),
                                  );
                                },
                              ),
                              Container(
                                  padding: const EdgeInsets.all(sizeMedium),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyPaginator(
                                          pageLength: ((details?.total ?? 1) ~/
                                                  (details?.perPage ?? 1)) +
                                              1,
                                          onPageChanged: (index) {
                                            myToast(index.toString());
                                          },
                                          primaryColor: Colors.white,
                                          secondaryColor: primaryColor,
                                          ),
                                      const CustomText(
                                        "TOTAL QTY, PACKING DAN BERAT",
                                        color: Colors.white,
                                        weight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        size: sizeMedium,
                                      ),
                                      CustomText(
                                        "QTY: ${data?.total} | Berat: 1270 KG",
                                        color: Colors.white,
                                      ),
                                      const CustomText(
                                        "TOTAL STOCK: 30.000",
                                        color: Colors.white,
                                        weight: FontWeight.bold,
                                        size: sizeMedium,
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        // TODO remove this and its bloc
                        Visibility(
                          visible: false,
                          child: Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: sizeBig),
                                  child: const CustomText(
                                    "Lokasi Anda",
                                    color: primaryGreen,
                                    size: sizeMedium,
                                    weight: FontWeight.w600,
                                  )),
                              BlocBuilder<BulkScanScreenCubit, BulkScanScreenState>(
                                builder: (context, state) {
                                  var text =
                                      "${state.sendScanDataModel.latitude ?? "?"}, ${state.sendScanDataModel.longtitude ?? "?"}";
                                  return RoundedContainer(sizeNormal,
                                      boxDecoration: BoxDecoration(
                                          border: Border.all(color: primaryGreen)),
                                      child: NoUnderlineTextFormField(
                                        controller: TextEditingController(text: text),
                                        enabled: false,
                                      ));
                                },
                              ),

                            ],
                          ),
                        ),
                        MyDropdownButton<String>(
                            ["Dropship","Pengiriman"], (v) => v,
                          hint: const Text("Status Pengiriman",style: TextStyle(color: primaryGreen),),
                        ),

                        ElevatedButton(
                            onPressed: () {
                              myToast("OI OI OI");
                              // context.router.push(const HistoryRoute());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor),
                            child: const Text("Simpan")),
                        // TODO pindahkan ke halaman scan dus
                        Visibility(
                          visible: false,
                          child: Column(children: [
                            MyImagePickerWidget(
                              //   setImageFilePath: (numb, theImage) => (){
                              //   print("INI NOMOR: $numb");
                              //   print("The Path: ${theImage?.path ?? ""}");
                              //   context.read<BulkScanScreenCubit>().setFotoPath(theImage?.path ?? "");
                              // },
                              functionCallbackSetImageFilePath:
                                  (numb, theImage) async {
                                // var size = theImage.runtimeType().toString();
                                print("INI NOMOR: $numb");
                                print("The Path: ${theImage?.path ?? ""}");
                                print("foto size: ${theImage.runtimeType}");

                                context
                                    .read<BulkScanScreenCubit>()
                                    .setFotoPath(theImage?.path ?? "");
                              },
                              defaultImagePlaceholder: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(sizeBig),
                                  child: RoundedContainer(
                                    sizeNormal,
                                    height: widthScreen(context) * 0.4,
                                    width: widthScreen(context) * 0.4,
                                    boxDecoration:
                                    const BoxDecoration(color: Colors.grey),
                                    child: const Center(
                                      child: FittedBox(
                                        child: CustomText(
                                          "No Picture",
                                          color: Colors.white,
                                          size: sizeBig,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      context.router.push(const HistoryRoute());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor),
                                    child: const Text("History")),
                                Builder(builder: (context) {
                                  return ElevatedButton(
                                      onPressed: () {
                                        var model = context
                                            .read<BulkScanScreenCubit>()
                                            .state
                                            .sendScanDataModel;
                                        context
                                            .read<QRScanBloc>()
                                            .add(SendScanEvent(model));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor),
                                      child: const Text("Simpan"));
                                }),
                              ],
                            )
                          ],),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
