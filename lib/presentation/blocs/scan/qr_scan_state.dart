part of 'qr_scan_bloc.dart';

abstract class QRScanState extends Equatable {
  const QRScanState();
}

class QRScanInitial extends QRScanState {
  @override
  List<Object> get props => [];
}

class QRScanLoading extends QRScanState {
  @override
  List<Object> get props => [];
}

class QRBulkScanSuccess extends QRScanState {
  final BulkScanResponse bulkScanResponse;
  const QRBulkScanSuccess(this.bulkScanResponse);
  @override
  List<Object> get props => [bulkScanResponse];
}

class QRSingleScanSuccess extends QRScanState {
  @override
  List<Object> get props => [];
}

class QRScanFailed extends QRScanState {
  final String errorMessage;

  get debug => "The Error is: $errorMessage";

  const QRScanFailed({this.errorMessage = "Unspecified Error"});

  @override
  List<Object?> get props => [errorMessage];
}
