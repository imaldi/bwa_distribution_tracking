import 'package:freezed_annotation/freezed_annotation.dart';

part 'surat_jalan_model.freezed.dart';
part 'surat_jalan_model.g.dart';
// @Freezed(makeCollectionsUnmodifiable: false)
@freezed
class SuratJalanModel with _$SuratJalanModel {
  @JsonSerializable(explicitToJson: true)
  const factory SuratJalanModel({
    String? id,
    String? nosj,
    @JsonKey(name: "qrcode_sj")
    String? qrcodeSj,
    String? total,
    String? onproses,
    String? selesai,
    @JsonKey(name: "created_by")
    String? createdBy,
    @JsonKey(name: "updated_by")
    String? updatedBy,
    @JsonKey(name: "created_at")
    DateTime? createdAt,
    @JsonKey(name: "updated_at")
    DateTime? updatedAt,
  })  = _SuratJalanModel;

  factory SuratJalanModel.fromJson(Map<String, Object?> json)
  => _$SuratJalanModelFromJson(json);
}