import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'surat_jalan_resp_data.freezed.dart';
part 'surat_jalan_resp_data.g.dart';

// @Freezed(makeCollectionsUnmodifiable: false)
@freezed
class SuratJalanRespData with _$SuratJalanRespData {
  @JsonSerializable(explicitToJson: true)
  const factory SuratJalanRespData({
    int? currentPage,
    List<SuratJalanModel>? data,
    @JsonKey(name: "first_page_url")
    String? firstPageUrl,
    int? from,
    @JsonKey(name: "last_page")
    int? lastPage,
    @JsonKey(name: "last_page_url")
    String? lastPageUrl,
    @JsonKey(name: "next_page_url")
    String? nextPageUrl,
    String? path,
    @JsonKey(name: "per_page")
    int? perPage,
    @JsonKey(name: "prev_page_url")
    String? prevPageUrl,
    int? to,
    int? total,
  }) = _SuratJalanRespData;

  factory SuratJalanRespData.fromJson(Map<String, Object?> json)
  => _$SuratJalanRespDataFromJson(json);
}