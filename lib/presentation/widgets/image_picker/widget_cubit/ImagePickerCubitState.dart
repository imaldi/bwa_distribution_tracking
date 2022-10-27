part of 'ImagePickerCubit.dart';

class ImagePickerCubitState extends Equatable {
  bool isInitialized;
  File? storedImage;
  bool isEnabled;
  String? imageURL;
  String? title;
  String? localImageURL;

  ImagePickerCubitState( {
    this.isInitialized = true,
    this.storedImage,
    this.isEnabled = true,
    this.imageURL,
    this.title,
    this.localImageURL,
  });

  @override
  List<Object?> get props => [
    isInitialized,
    storedImage,
    isEnabled,
    imageURL,
    title,
    localImageURL,
  ];
}
