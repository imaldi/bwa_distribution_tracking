import 'package:freezed_annotation/freezed_annotation.dart';

import 'dus_list_response.dart';


part 'dus_scan_response.freezed.dart';
part 'dus_scan_response.g.dart';

@freezed
class DusScanResponse with _$DusScanResponse{
  const factory DusScanResponse({
    bool? success,
    String? message,
    @JsonKey(name: "data_dus") DusData? dataDus,
  }) = _DusScanResponse;

  factory DusScanResponse.fromJson(Map<String, Object?> json)
  => _$DusScanResponseFromJson(json);
}