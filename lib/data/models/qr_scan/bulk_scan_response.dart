import 'package:bwa_distribution_tracking/data/models/qr_scan/box_q_r_scan_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_q_r_scan_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../surat_jalan/surat_jalan_model.dart';
import 'bulk_scan_qr_detail_per_page.dart';
import 'dus_list_response/dus_list_response.dart';

part 'bulk_scan_response.freezed.dart';
part 'bulk_scan_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BulkScanResponse with _$BulkScanResponse{

  // @HiveType(typeId: bulkScanResponseTypeId,adapterName: 'BulkScanResponseAdapter')
  @JsonSerializable(explicitToJson: true)
  const factory BulkScanResponse({
    bool? success,
    String? message,
    List<SuratJalanModel>? header,
    List<BulkQRScanModel>? data,
    BulkScanQrDetailPerPage? detail,
    List<SendScanDataModel>? nosjhistory,
    List<DusData>? dushistory,
  }) = _BulkScanResponse;

  factory BulkScanResponse.fromJson(Map<String, Object?> json)
  => _$BulkScanResponseFromJson(json);
}
