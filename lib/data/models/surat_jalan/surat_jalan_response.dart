import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_resp_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'surat_jalan_response.freezed.dart';
part 'surat_jalan_response.g.dart';



@Freezed(makeCollectionsUnmodifiable: false)
class SuratJalanResponse with _$SuratJalanResponse {
  @JsonSerializable(explicitToJson: true)
  const factory SuratJalanResponse({
    bool? success,
    String? message,
    SuratJalanRespData? data,
  }) = _SuratJalanResponse;

  factory SuratJalanResponse.fromJson(Map<String, Object?> json)
  => _$SuratJalanResponseFromJson(json);
}




