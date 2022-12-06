import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_header.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'store_selesai_response.freezed.dart';
part 'store_selesai_response.g.dart';

@freezed
class StoreSelesaiResponse with _$StoreSelesaiResponse{


  const factory StoreSelesaiResponse({
    bool? success,
    @Default(StoreSelesaiHeader())  StoreSelesaiHeader? header,
  }) = _StoreSelesaiResponse;

  factory StoreSelesaiResponse.fromJson(Map<String, Object?> json)
  => _$StoreSelesaiResponseFromJson(json);
}