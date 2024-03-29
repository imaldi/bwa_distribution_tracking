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

class SendScanEvent extends QRScanEvent {
  final SendScanDataModel model;
  final int total;
  const SendScanEvent(this.model,this.total);
  @override
  List<Object?> get props => [model, total];
}

class MunculkanToastEvent extends QRScanEvent{
  @override
  List<Object?> get props => [];

}
