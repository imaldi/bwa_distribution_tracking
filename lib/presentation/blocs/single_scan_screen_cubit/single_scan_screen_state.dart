part of 'single_scan_screen_cubit.dart';



@freezed
class SingleScanScreenState with _$SingleScanScreenState{
  const factory SingleScanScreenState({
    DusListResponse? dusListResponse,
    DusScanResponse? dusScanResponse,
    @Default(StoreSelesaiResponse()) StoreSelesaiResponse? storeSelesaiResponse,
  }) = _SingleScanScreenState;

  factory SingleScanScreenState.fromJson(Map<String, Object?> json)
  => _$SingleScanScreenStateFromJson(json);
}