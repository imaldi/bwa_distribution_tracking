part of 'bulk_scan_screen_cubit.dart';

// TODO buat jadi freezed saja supaya ada copywith
class BulkScanScreenState extends Equatable {
  final SendScanDataModel sendScanDataModel;
  const BulkScanScreenState(this.sendScanDataModel);

  @override
  List<Object?> get props => [
    sendScanDataModel
  ];
}
