import 'package:equatable/equatable.dart';

class SuratJalanPerPageParams extends Equatable {
  final int pageNumber;

  SuratJalanPerPageParams(this.pageNumber);


  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        pageNumber
      ];
}