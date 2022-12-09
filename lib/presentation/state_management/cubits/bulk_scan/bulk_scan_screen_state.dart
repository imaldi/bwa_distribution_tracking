part of 'bulk_scan_screen_cubit.dart';

class BulkScanScreenState extends Equatable {
  final SendScanDataModel sendScanDataModel;
  final String? address;
  const BulkScanScreenState(this.sendScanDataModel, {this.address});

  BulkScanScreenState copyWith({
    SendScanDataModel? sendScanDataModel,
    String? address,
  }) {
    return BulkScanScreenState(sendScanDataModel ?? this.sendScanDataModel,
        address: address ?? this.address);
  }

  @override
  List<Object?> get props => [sendScanDataModel, address];
}
