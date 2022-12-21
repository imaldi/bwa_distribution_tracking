import 'package:equatable/equatable.dart';

class SuratJalanPerPageParams extends Equatable {
  final int pageNumber;

  SuratJalanPerPageParams(this.pageNumber,);


  @override
  List<Object?> get props =>
      [
        pageNumber,
      ];
}