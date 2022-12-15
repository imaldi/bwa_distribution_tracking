import 'package:freezed_annotation/freezed_annotation.dart';

part 'dus_list_response.freezed.dart';
part 'dus_list_response.g.dart';

@freezed
class DusListResponse with _$DusListResponse {
  const factory DusListResponse({
    bool? success,
    String? message,
    List<DusData>? data,
  }) = _DusListResponse;

  factory DusListResponse.fromJson(Map<String, Object?> json) =>
      _$DusListResponseFromJson(json);
}

@freezed
class DusData with _$DusData {
  const factory DusData({
    int? id,
    String? nosj,
    @JsonKey(name: 'qrcode_sj') String? qrcodeSj,
    String? nodus,
    Object? foto,
    @JsonKey(name: 'id_location') String? idLocation,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'updated_by') String? updatedBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DusData;

  factory DusData.fromJson(Map<String, Object?> json) =>
      _$DusDataFromJson(json);
}
