import 'package:intl/intl.dart';

String formatDate(DateTime? dateNow, {bool withTimes = false, bool onlyTimes = false, bool onlyTimeWithoutSecond = false}) {
  String date = "yyyy/dd/hh";
  if(dateNow != null && onlyTimeWithoutSecond) {
    return DateFormat("HH:mm").format(dateNow);
  }
  if (dateNow != null) {
    date = DateFormat("dd MMMM yyyy").format(dateNow);
    if (withTimes && onlyTimes == false) {
      date = DateFormat("dd MMMM yyyy HH:mm:ss").format(dateNow);
    } else if (onlyTimes) {
      date = DateFormat("HH:mm:ss").format(dateNow);
    }
  } else {
    return "";
  }
  return date;
}