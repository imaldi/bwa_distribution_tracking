import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';


part 'send_scan_response.freezed.dart';
part 'send_scan_response.g.dart';

@freezed
class SendScanResponse with _$SendScanResponse{

  const factory SendScanResponse({
    bool? success,

  }) = _SendScanResponse;

  factory SendScanResponse.fromJson(Map<String, Object?> json)
  => _$SendScanResponseFromJson(json);
}