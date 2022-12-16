import 'package:equatable/equatable.dart';

class SuratJalanPerPageParams extends Equatable {
  final int pageNumber;
  final String statusPengiriman;

  SuratJalanPerPageParams(this.pageNumber,this.statusPengiriman);


  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        pageNumber,
        statusPengiriman
      ];
}