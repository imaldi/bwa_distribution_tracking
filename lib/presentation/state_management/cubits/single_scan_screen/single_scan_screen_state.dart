part of 'single_scan_screen_cubit.dart';



@freezed
class SingleScanScreenCubitState with _$SingleScanScreenCubitState{
  const factory SingleScanScreenCubitState({
    DusListResponse? dusListResponse,
    DusScanResponse? dusScanResponse,
    @Default(1) int currentDusNumber,
    Map<String, String>? qrCodeAndPhotoPathMap,
    @Default(StoreSelesaiResponse()) StoreSelesaiResponse? storeSelesaiResponse,
  }) = _SingleScanScreenState;

  factory SingleScanScreenCubitState.fromJson(Map<String, Object?> json)
  => _$SingleScanScreenCubitStateFromJson(json);
}