import 'package:intl/intl.dart';

class CustomUtils {
  static String formatDate(String format, DateTime dateTime) {
    return DateFormat(format).format(dateTime);
  }

  static String formatDateDatabase(String format, String dbDate) {
    final date = DateTime.parse(dbDate);
    return DateFormat(format, "id_ID").format(date);
  }

  // static String formatYear(DateTime dateTime) {
  //   return DateFormat('yyyy').format(dateTime);
  // }
  //
  // static String formatTime(DateTime dateTime) {
  //   return DateFormat('hh:mm:ss').format(dateTime);
  // }

  // static String formatDate(DateTime date) {
  //   return DateFormat('yyyy-MM-dd').format(date);
  // }

  // static String formatDateTime(DateTime date) {
  //   return DateFormat('yyyy-MM-dd hh:mm:ss').format(date);
  // }
  //
  // static String formatDateUi(DateTime date) {
  //   return DateFormat('dd/MM/yyyy').format(date);
  // }
  //
  // static String formatDateTimeUi(DateTime date) {
  //   return DateFormat('dd/MM/yyyy hh:mm:ss').format(date);
  // }
}
