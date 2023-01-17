import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../../../core/resources/helper/file_compressor.dart';
import '../../../core/resources/helper/file_size_check.dart';
import '../container/rounded_container.dart';
import '../image_picker/widget_cubit/ImagePickerCubit.dart';
import '../my_confirm_dialog/my_confirm_dialog.dart';
import '../text/custom_text.dart';
import '../toast/my_toast.dart';

class ScanDusAndChoosePictureWidget extends StatefulWidget {
  final void Function(String, File?)? functionCallbackSetImageFilePath;

  const ScanDusAndChoosePictureWidget({this.functionCallbackSetImageFilePath, Key? key}) : super(key: key);

  @override
  _ScanDusAndChoosePictureWidgetState createState() =>
      _ScanDusAndChoosePictureWidgetState();
}

class _ScanDusAndChoosePictureWidgetState
    extends State<ScanDusAndChoosePictureWidget> {
  late File _storedImage;

  Future _showDialogPickImageFromGalleryOrCamera(
      BuildContext context, String qrCode, ImagePickerCubitState state) async {
    return myConfirmDialog(context,
        basicContentString: "Choose Report Image",
        positiveButton: () async {
          await _pickFile(context, qrCode, state);
        },
        positiveButtonText: "From Gallery",
        negativeButton: () async {
          await _takePicture(context, qrCode, state);
        },
        negativeButtonText: "Pick From Camera",
        dismissedDialogCallback: () {
          if(widget.functionCallbackSetImageFilePath != null) {
            widget.functionCallbackSetImageFilePath!(qrCode,null);
          }
        },
    );
  }

  Future _takePicture(BuildContext context, String qrCode, ImagePickerCubitState state) async {
    ImagePicker imagePicker = ImagePicker();
    var cubit = context.read<ImagePickerCubit>();

    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.camera).whenComplete(() {
      // setState(() {});
      context.router.pop();
      // Navigator.of(context).pop();
    });
    print("pickedFile path : ${pickedFile?.path}");

    _storedImage = File(pickedFile?.path ?? "");
    print(
        "image size in widget: ${fileSizeCheckInMB(_storedImage.readAsBytesSync().lengthInBytes)} MB");

    _storedImage = await fileCompressor(_storedImage);
    print(
        "image size after Compressed: ${fileSizeCheckInMB(_storedImage.readAsBytesSync().lengthInBytes)} MB");

    cubit.updateState(storedImage: _storedImage);
    widget.functionCallbackSetImageFilePath?.call(qrCode, _storedImage);
    // widget.setImageFilePath(0,_storedImage);
    print("_storedImage path : ${_storedImage.path}");
    cubit.updateState(storedImage: _storedImage);

    FocusScope.of(context).unfocus();
    // context.router.pop();
  }

  Future _pickFile(BuildContext context, String qrCode, ImagePickerCubitState state) async {
    var cubit = context.read<ImagePickerCubit>();

    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if(result != null) {
    // _storedImage = File(result.files.single.path ?? "");
    ImagePicker imagePicker = ImagePicker();

    XFile? pickedFile = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .whenComplete(() {
      // setState(() {});
    });

    print("pickedFile path : ${pickedFile?.path}");

    _storedImage = File(pickedFile?.path ?? "");
    print(
        "image size in widget: ${fileSizeCheckInMB(_storedImage.readAsBytesSync().lengthInBytes)} MB");
    _storedImage = await fileCompressor(_storedImage);
    print(
        "image size after Compressed: ${fileSizeCheckInMB(_storedImage.readAsBytesSync().lengthInBytes)} MB");

    cubit.updateState(storedImage: _storedImage);

    widget.functionCallbackSetImageFilePath?.call(qrCode, _storedImage);

    print("_storedImage path : ${_storedImage.path}");
    FocusScope.of(context).unfocus();
    // context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: BlocBuilder<ImagePickerCubit, ImagePickerCubitState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  // context.router.push(
                  //     const TestDhriveRoute()
                  // );
                  await BarcodeScanner.scan().then((ScanResult bulkDetail) {
                    if (bulkDetail.rawContent.isNotEmpty) {
                      myToast(bulkDetail.rawContent);
                      _showDialogPickImageFromGalleryOrCamera(context,bulkDetail.rawContent,state);
                    }
                  });
                },
                child: const RoundedContainer(
                  sizeMedium,
                  padding: EdgeInsets.all(sizeBig),
                  margin: EdgeInsets.only(
                      right: sizeMedium,
                      left: sizeMedium,
                      top: sizeMedium,
                      bottom: sizeNormal),
                  boxDecoration: BoxDecoration(color: primaryColor),
                  child: Icon(
                    Icons.qr_code_2,
                    color: Colors.white,
                    size: sizeHuge,
                  ),
                  // SvgPicture.asset(
                  //     "assets/images/camera_white.svg"),
                ),
              ),
              const CustomText(
                "QR Code Dus",
                textAlign: TextAlign.center,
                color: primaryColor,
              )
            ]..map((e) => FittedBox(
                  child: e,
                )),
          );
        },
      ),
    );
  }
}
