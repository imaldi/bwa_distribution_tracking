import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/gradients/basic_linear_gradient.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/cubit/bulk_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/image_picker/my_image_picker.dart';
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

    context.read<BulkScanScreenCubit>().getCurrentCoordinate();
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
                if(state is SendScanSuccess){
                  myToast("Send Scan Success");
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
              }
              if (state is QRBulkScanSuccess) {
                // response = state.bulkScanResponse;
                var data = state.bulkScanResponse.data?.first;
                var details = state.bulkScanResponse.detail;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(sizeMedium),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomText(
                          "NOMOR ID",
                          color: primaryBlue,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          "${data?.nosj}",
                          color: primaryBlue,
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
                                      "Dikirim Dengan",
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
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                // padding: const EdgeInsets.all(sizeNormal),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:
                                    state.bulkScanResponse.detail?.length,
                                itemBuilder: (cont, ind) {
                                  return Container(
                                    color: ind % 2 == 0
                                        ? null
                                        : primaryDarkerColor,
                                    child: ListTile(
                                        title: Center(
                                            child: CustomText(
                                      "Kode Batch: ${details?[ind].kodeBatch} | Nama Barang (Project): ${details?[ind].nmProject} | QTY: ${details?[ind].jmlKeluar} | Satuan: Satuan | Jumlah: ${details?[ind].jmlKeluar} | Satuan: KG",
                                      color: Colors.white,
                                      textAlign: TextAlign.center,
                                    ))),
                                  );
                                },
                              ),
                              Container(
                                  padding: const EdgeInsets.all(sizeMedium),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                        BlocBuilder<BulkScanScreenCubit, BulkScanScreenState>(
                          builder: (context, state) {
                            var text =
                                "${state.sendScanDataModel.latitude ?? "?"}, ${state.sendScanDataModel.longtitude ?? "?"}";
                            return RoundedContainer(sizeNormal,
                                boxDecoration: BoxDecoration(
                                    border: Border.all(color: primaryGreen)),
                                child: NoUnderlineTextFormField(
                                  controller: TextEditingController(text: text),
                                ));
                          },
                        ),
                        MyImagePickerWidget(
                          //   setImageFilePath: (numb, theImage) => (){
                          //   print("INI NOMOR: $numb");
                          //   print("The Path: ${theImage?.path ?? ""}");
                          //   context.read<BulkScanScreenCubit>().setFotoPath(theImage?.path ?? "");
                          // },
                          functionCallbackSetImageFilePath: (numb, theImage) async {
                            // var size = theImage.runtimeType().toString();
                            print("INI NOMOR: $numb");
                            print("The Path: ${theImage?.path ?? ""}");
                            print("foto size: ${theImage.runtimeType}");

                            context
                                .read<BulkScanScreenCubit>()
                                .setFotoPath(theImage?.path ?? "");
                          },
                        ),
                        Builder(
                          builder: (context) {
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
                          }
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
