library bulk_scan_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import '../../core/resources/serializers/serializers.dart';

part 'bulk_scan_response.g.dart';

abstract class BulkScanResponse
    implements Built<BulkScanResponse, BulkScanResponseBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  // String? get aField;
  bool? get success;
  String? get message;
  BuiltList<BulkQRScanModel>? get data;
  BuiltList<BoxQRScanModel>? get detail;

  BulkScanResponse._();

  factory BulkScanResponse([Function(BulkScanResponseBuilder b) updates]) =
      _$BulkScanResponse;

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(
        serializers.serializeWith(BulkScanResponse.serializer, this)));
  }

  static BulkScanResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
            BulkScanResponse.serializer, json.decode(jsonString)) ??
        BulkScanResponse();
  }

  static Serializer<BulkScanResponse> get serializer =>
      _$bulkScanResponseSerializer;
}

abstract class BulkQRScanModel
    implements Built<BulkQRScanModel, BulkQRScanModelBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  int? get id;
  String? get nosj;
  @BuiltValueField(wireName: 'qrcode_sj')
  String? get qrcodeSj;
  String? get nopc;
  @BuiltValueField(wireName: 'kode_batch')
  String? get kodeBatch;
  String? get alamat;
  String? get pic;
  @BuiltValueField(wireName: 'pic_telp')
  String? get picTelp;
  String? get tanggal;
  @BuiltValueField(wireName: 'dikirim_by')
  String? get dikirimBy;
  String? get nopol;
  @BuiltValueField(wireName: 'nm_pengemudi')
  String? get nmPengemudi;
  String? get notelp;
  String? get approval;
  String? get total;
  String? get kg;
  @BuiltValueField(wireName: 'ttd_ga')
  String? get ttdGa;
  @BuiltValueField(wireName: 'ttd_wl')
  String? get ttdWl;
  @BuiltValueField(wireName: 'created_by')
  String? get createdBy;
  @BuiltValueField(wireName: 'updated_by')
  String? get updatedBy;
  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  BulkQRScanModel._();

  factory BulkQRScanModel([Function(BulkQRScanModelBuilder b) updates]) =
      _$BulkQRScanModel;

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(
        serializers.serializeWith(BulkQRScanModel.serializer, this)));
  }

  static BulkQRScanModel fromJson(String jsonString) {
    return serializers.deserializeWith(
            BulkQRScanModel.serializer, json.decode(jsonString)) ??
        BulkQRScanModel();
  }

  static Serializer<BulkQRScanModel> get serializer =>
      _$bulkQRScanModelSerializer;
}

abstract class BoxQRScanModel
    implements Built<BoxQRScanModel, BoxQRScanModelBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  int? get id;
  String? get notrans;
  String? get nosj;
  @BuiltValueField(wireName: 'kode_batch')
  String? get kodeBatch;
  @BuiltValueField(wireName: 'nm_project')
  String? get nmProject;
  @BuiltValueField(wireName: 'jenis_quran')
  String? get jenisQuran;
  @BuiltValueField(wireName: 'jml_keluar')
  String? get jmlKeluar;
  String? get vendor;
  String? get warehouse;
  String? get status;
  @BuiltValueField(wireName: 'jenis_reject')
  String? get jenisReject;
  String? get keterangan;
  String? get approval;
  String? get nopc;
  String? get upload;
  @BuiltValueField(wireName: 'tgl_diajukan')
  String? get tglDiajukan;
  @BuiltValueField(wireName: 'created_by')
  String? get createdBy;
  @BuiltValueField(wireName: 'updated_by')
  String? get updatedBy;
  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  BoxQRScanModel._();

  factory BoxQRScanModel([Function(BoxQRScanModelBuilder b) updates]) =
      _$BoxQRScanModel;

  Map<String, dynamic> toJson() {
    return jsonDecode(
        jsonEncode(serializers.serializeWith(BoxQRScanModel.serializer, this)));
  }

  static BoxQRScanModel fromJson(String jsonString) {
    return serializers.deserializeWith(
            BoxQRScanModel.serializer, json.decode(jsonString)) ??
        BoxQRScanModel();
  }

  static Serializer<BoxQRScanModel> get serializer =>
      _$boxQRScanModelSerializer;
}
