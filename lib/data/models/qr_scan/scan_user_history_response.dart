import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_user_history_response.freezed.dart';
part 'scan_user_history_response.g.dart';

@freezed
class ScanUserHistoryResponse with _$ScanUserHistoryResponse{
  const factory ScanUserHistoryResponse({
    bool? success,
    List<SendScanDataModel>? data,
  }) = _ScanUserHistoryResponse;

  factory ScanUserHistoryResponse.fromJson(Map<String, Object?> json)
  => _$ScanUserHistoryResponseFromJson(json);
}