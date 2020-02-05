import 'package:intl/intl.dart';

class FormatDateUtil {
  String targetDate() {
    DateTime now = DateTime.now();
    String targetDate = DateFormat('yyyyMMdd').format(now);
    print(targetDate);
    return targetDate;
  }
}