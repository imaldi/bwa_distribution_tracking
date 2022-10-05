part of 'qr_scan_bloc.dart';

abstract class QRScanEvent extends Equatable {
  const QRScanEvent();
}

class BulkQRScanEvent extends QRScanEvent {
  final String qrcodeSj;
  const BulkQRScanEvent(this.qrcodeSj);
  @override
  List<Object?> get props => [qrcodeSj];
}
