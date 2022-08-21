import 'package:intl/intl.dart';

class AppUtils {
  static String getTimeFromDateString(String givenDate) {
    var inputDate = DateTime.parse(givenDate);
    var outputFormat = DateFormat("hh:mm a");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
