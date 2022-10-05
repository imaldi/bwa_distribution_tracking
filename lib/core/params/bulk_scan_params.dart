import 'package:equatable/equatable.dart';

class BulkScanParams extends Equatable {
  final String qrcodeSj;

  const BulkScanParams(this.qrcodeSj);

  @override
  List<Object?> get props => [qrcodeSj];
}