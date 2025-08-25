import 'package:intl/intl.dart';

class DateFormatUtils {
  static String format(DateTime date) => DateFormat('yyyy/MM/dd').format(date);
}