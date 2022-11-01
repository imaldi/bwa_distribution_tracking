import 'dart:io';


// import 'package:file_picker/file_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/container/rounded_container.dart';
import 'package:bwa_distribution_tracking/presentation/widgets/my_confirm_dialog/my_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'widget_cubit/ImagePickerCubit.dart';

// bool _checkIsEmptyDefault() {
//   return true;
// }

class MyImagePickerWidget extends StatefulWidget {
  MyImagePickerWidget(
      {
        Key? key,
        this.functionCallbackSetImageFilePath,
        this.isEnabled = true,
        this.imageURL,
        this.title,
        this.localImageURL,
        // this.checkIsEmpty = _checkIsEmptyDefault
      }) : super(key: key);

  // File? issuerImage;
  // final void Function(int, File?) setImageFilePath;
  final Function(int,File?)? functionCallbackSetImageFilePath;
  // bool Function() checkIsEmpty;
  bool isEnabled;
  String? imageURL;
  String? localImageURL;
  String? title;

  @override
  _MyImagePickerWidgetState createState() => _MyImagePickerWidgetState();
}

class _MyImagePickerWidgetState extends State<MyImagePickerWidget> {
  File? _storedImage;

  // File ;
  Future _takePicture(BuildContext context, ImagePickerCubitState state) async {
    ImagePicker imagePicker = ImagePicker();
    var cubit = context.read<ImagePickerCubit>();

    PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.camera).whenComplete(() {
      // setState(() {});
      context.router.pop();
      // Navigator.of(context).pop();
    });
    print("pickedFile path : ${pickedFile?.path}");


    _storedImage = File(pickedFile?.path ?? "");
    cubit.updateState(storedImage: _storedImage);
    widget.functionCallbackSetImageFilePath?.call(69,_storedImage);
    // widget.setImageFilePath(0,_storedImage);
    print("_storedImage path : ${_storedImage?.path}");
    FocusScope.of(context).unfocus();

    // print("_storedImage path : ${_storedImage?.path}");

    // widget.issuerImage = _storedImage;
    // ImagePicker imagePicker = ImagePicker();
    // final imageFile = await imagePicker.getImage(source: ImageSource.camera,
    //   maxWidth: 600,
    // );
    // if (imageFile == null) {
    //   return;
    // }
    // setState(() {
    //   _storedImage = imageFile;
    // });
    // final appDir = await syspaths.getApplicationDocumentsDirectory();    final fileName = path.basename(imageFile.path);
    // final savedImage = await imageFile.copy('${appDir.path}/$fileName');
  }

  Future _pickFile(BuildContext context, ImagePickerCubitState state) async {
    var cubit = context.read<ImagePickerCubit>();

    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if(result != null) {
    // _storedImage = File(result.files.single.path ?? "");
    ImagePicker imagePicker = ImagePicker();

    PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery).whenComplete(() {
      // setState(() {});
    });

    print("pickedFile path : ${pickedFile?.path}");

    _storedImage = File(pickedFile?.path ?? "");
    // widget.issuerImage = _storedImage;
    cubit.updateState(storedImage: _storedImage);

    widget.functionCallbackSetImageFilePath?.call(0,_storedImage);

    print("_storedImage path : ${_storedImage?.path}");
    FocusScope.of(context).unfocus();

    // print("issuerImage from detail page path : ${widget.issuerImage?.path}");
    // } else {
    //   // User canceled the picker
    // }
  }

  Future _showDialogPickImageFromGalleryOrCamera(BuildContext context, ImagePickerCubitState state) async {
    return myConfirmDialog(context,
        basicContentString: "Choose Report Image",
        positiveButton: () async {
          await _pickFile(context, state);
          // setState(() {
          //   print("setState when picfile called");
          //   widget.imageURL = null;
          //   print("widget.imageURL ${widget.imageURL}");
          //
          // });
        },
        positiveButtonText: "From Gallery",
        negativeButton: () async {
          await _takePicture(context, state);
          // setState(() {
          //   print("setState when picfile called");
          //   widget.imageURL = null;
          //   print("widget.imageURL ${widget.imageURL}");
          //
          // });
        },
        negativeButtonText: "Pick From Camera");
  }

  // @override
  // void initState() {
  //   // if (!widget.checkIsEmpty()) {
  //   //   widget.imageURL == null;
  //   // }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return ImagePickerCubit(); },
      child: Builder(
          builder: (builderContext) {
            var cubitInst = builderContext.read<ImagePickerCubit>();

            var cubitState = builderContext.watch<ImagePickerCubit>().state;

            if(!cubitState.isInitialized){
              cubitInst.initLocalImagePickerState(
                // storedImage: storedImage,
                isEnabled: widget.isEnabled,
                imageURL: widget.imageURL,
                title: widget.title,
                localImageURL: widget.localImageURL,
              );
            }
            return InkWell(
              onTap: cubitState.isEnabled
                  ? () {
                _showDialogPickImageFromGalleryOrCamera(builderContext, cubitState);

                // _pickFile();
              }
                  : null,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeHuge * 5,
                      width: sizeHuge * 5,
                      child: RoundedContainer(
                        sizeNormal,
                        // height: sizeHuge * 4,
                        // width:
                        child: (cubitState.imageURL == null)
                            ? cubitState.storedImage == null
                            ? const Icon(
                          Icons.image,
                          size: sizeHuge * 4,
                          color: primaryGreen,
                        )
                            : Image.file(cubitState.storedImage!,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              // setState(() {
                              cubitState.imageURL = null;
                              // });
                              return const Icon(
                                Icons.image,
                                size: sizeHuge * 3,
                                color: primaryGreen,
                              );
                            })
                            : (cubitState.localImageURL != cubitState.imageURL && cubitState.localImageURL != null && cubitState.storedImage != null)
                            ? Image.file(cubitState.storedImage!,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              // setState(() {
                              cubitState.imageURL = null;
                              // });
                              return const Icon(
                                Icons.image,
                                size: sizeHuge * 3,
                                color: primaryGreen,
                              );
                            })
                            : Image.network(
                          cubitState.imageURL!,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            // setState(() {
                            cubitState.imageURL = null;
                            // });
                            return const Icon(
                              Icons.image,
                              size: sizeHuge * 3,
                              color: primaryGreen,
                            );
                          },
                        ),
                      ),
                    ),
                    Visibility(visible: cubitState.title != null, child: Container(padding: const EdgeInsets.all(sizeNormal),child: Text("${cubitState.title ?? ""}")))
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
