import 'package:bwa_distribution_tracking/data/models/qr_scan/box_q_r_scan_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_q_r_scan_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_scan_response.freezed.dart';
part 'bulk_scan_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BulkScanResponse with _$BulkScanResponse{

  // @HiveType(typeId: bulkScanResponseTypeId,adapterName: 'BulkScanResponseAdapter')
  @JsonSerializable(explicitToJson: true)
  const factory BulkScanResponse({
    bool? success,
    String? message,
    List<BulkQRScanModel>? data,
    List<BoxQRScanModel>? detail,
  }) = _BulkScanResponse;

  factory BulkScanResponse.fromJson(Map<String, Object?> json)
  => _$BulkScanResponseFromJson(json);
}
