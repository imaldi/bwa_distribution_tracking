import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_selesai_header.freezed.dart';
part 'store_selesai_header.g.dart';

@freezed
class StoreSelesaiHeader with _$StoreSelesaiHeader{

  const factory StoreSelesaiHeader({
    String? nosj,
    @JsonKey(name: "qrcode_sj") String? qrcodeSj,
    @JsonKey(name: "location_id") String? locationId,
    String? latitude,
    String? longtitude,
    @JsonKey(name: "nama_penerima") String? namaPenerima,
    @JsonKey(name: "no_hp") String? noHp,
    String? lembaga,
    @JsonKey(name: "nm_tempat") String? nmTempat,
    @JsonKey(name: "detail_tempat") String? detailTempat,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    @JsonKey(name: "status_pengiriman") String? statusPengiriman,
    Object? foto,
    @JsonKey(name: "created_by") String? createdBy,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "created_at") DateTime? createdAt,
    int? id,
  }) = _StoreSelesaiHeader;

  factory StoreSelesaiHeader.fromJson(Map<String, Object?> json)
  => _$StoreSelesaiHeaderFromJson(json);
}