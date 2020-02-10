import 'package:intl/intl.dart';

class FormatDateUtil {

  String targetDate() {

    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    String targetDate = DateFormat('yyyyMMdd').format(yesterday);

    return targetDate;
  }

  String todayDate() {

    DateTime now = DateTime.now();
    String todayDate = DateFormat('yyyyMMdd').format(now);

    return todayDate;
  }
}