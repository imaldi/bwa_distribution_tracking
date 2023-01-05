import 'package:equatable/equatable.dart';

class SuratJalanParams extends Equatable {
  final String qrcodeSj;

  const SuratJalanParams(this.qrcodeSj);

  @override
  List<Object?> get props => [qrcodeSj];
}