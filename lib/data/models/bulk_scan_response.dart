library bulk_scan_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import '../../core/resources/serializers/serializers.dart';

part 'bulk_scan_response.g.dart';

abstract class BulkScanResponse implements Built<BulkScanResponse, BulkScanResponseBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  // String? get aField;
  bool? get success;
  String? get message;
  BuiltList<BulkQRScanModel>? get data;
  BuiltList<BoxQRScanModel>? get detail;

  BulkScanResponse._();

  factory BulkScanResponse([Function(BulkScanResponseBuilder b) updates]) = _$BulkScanResponse;

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(serializers.serializeWith(BulkScanResponse.serializer, this)));
  }

  static BulkScanResponse fromJson(String jsonString) {
    return serializers.deserializeWith(BulkScanResponse.serializer, json.decode(jsonString)) ??
        BulkScanResponse();
  }

  static Serializer<BulkScanResponse> get serializer => _$bulkScanResponseSerializer;
}

abstract class BulkQRScanModel implements Built<BulkQRScanModel, BulkQRScanModelBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  int? get id;
  String? get nosj;
  String? get qrcodeSj;
  String? get nopc;
  String? get kodeBatch;
  String? get alamat;
  String? get pic;
  String? get picTelp;
  DateTime? get tanggal;
  String? get dikirimBy;
  String? get nopol;
  String? get nmPengemudi;
  String? get notelp;
  String? get approval;
  String? get total;
  String? get kg;
  String? get ttdGa;
  String? get ttdWl;
  String? get createdBy;
  DateTime? get updatedBy;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  
  BulkQRScanModel._();

  factory BulkQRScanModel([Function(BulkQRScanModelBuilder b) updates]) = _$BulkQRScanModel;
  
  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(serializers.serializeWith(BulkQRScanModel.serializer, this)));
  }

  static BulkQRScanModel fromJson(String jsonString) {
    return serializers.deserializeWith(BulkQRScanModel.serializer, json.decode(jsonString)) ??
        BulkQRScanModel();
  }

  static Serializer<BulkQRScanModel> get serializer => _$bulkQRScanModelSerializer;
}

abstract class BoxQRScanModel implements Built<BoxQRScanModel, BoxQRScanModelBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  int? get id;
  String? get notrans;
  String? get nosj;
  String? get kodeBatch;
  String? get nmProject;
  String? get jenisQuran;
  String? get jmlKeluar;
  String? get vendor;
  String? get warehouse;
  String? get status;
  String? get jenisReject;
  String? get keterangan;
  String? get approval;
  String? get nopc;
  String? get upload;
  DateTime? get tglDiajukan;
  String? get createdBy;
  String? get updatedBy;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  BoxQRScanModel._();

  factory BoxQRScanModel([Function(BoxQRScanModelBuilder b) updates]) = _$BoxQRScanModel;

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(serializers.serializeWith(BoxQRScanModel.serializer, this)));
  }

  static BoxQRScanModel fromJson(String jsonString) {
    return serializers.deserializeWith(BoxQRScanModel.serializer, json.decode(jsonString)) ??
        BoxQRScanModel();
  }

  static Serializer<BoxQRScanModel> get serializer => _$boxQRScanModelSerializer;
}