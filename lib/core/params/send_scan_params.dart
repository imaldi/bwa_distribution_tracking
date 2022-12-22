import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:equatable/equatable.dart';

class SendScanParams extends Equatable {
  final SendScanDataModel model;
  final int total;

  const SendScanParams(this.model,this.total);

  @override
  List<Object?> get props => [model, total];
}