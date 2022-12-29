import 'package:intl/intl.dart';

String indonesianNumberFormat(String? theNumber){
  var safeNumbString = theNumber ?? "";
  return NumberFormat.decimalPattern('id').format(int.parse(safeNumbString.isNotEmpty ? safeNumbString : "0"));
}