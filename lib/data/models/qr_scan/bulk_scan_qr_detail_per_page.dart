import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'box_q_r_scan_model.dart';

part 'bulk_scan_qr_detail_per_page.freezed.dart';
part 'bulk_scan_qr_detail_per_page.g.dart';

// @Freezed(makeCollectionsUnmodifiable: false)
@freezed
class BulkScanQrDetailPerPage with _$BulkScanQrDetailPerPage {
  @JsonSerializable(explicitToJson: true)
  const factory BulkScanQrDetailPerPage({
    int? currentPage,
    List<BoxQRScanModel>? data,
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
  }) = _BulkScanQrDetailPerPage;

  factory BulkScanQrDetailPerPage.fromJson(Map<String, Object?> json)
  => _$BulkScanQrDetailPerPageFromJson(json);
}