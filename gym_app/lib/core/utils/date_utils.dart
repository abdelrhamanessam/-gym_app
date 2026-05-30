import 'package:intl/intl.dart';

class DateUtilsExt {
  DateUtilsExt._();

  static final _dateFormat = DateFormat('MMM dd, yyyy');
  static final _timeFormat = DateFormat('hh:mm a');
  static final _dateTimeFormat = DateFormat('MMM dd, yyyy - hh:mm a');
  static final _dayMonthFormat = DateFormat('MMM dd');
  static final _monthYearFormat = DateFormat('MMMM yyyy');
  static final _weekdayFormat = DateFormat('EEEE');
  static final _shortWeekdayFormat = DateFormat('EEE');
  static final _isoDateFormat = DateFormat('yyyy-MM-dd');
  static final _isoDateTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

  static String formatDate(DateTime date) => _dateFormat.format(date);

  static String formatTime(DateTime date) => _timeFormat.format(date);

  static String formatDateTime(DateTime date) => _dateTimeFormat.format(date);

  static String formatDayMonth(DateTime date) => _dayMonthFormat.format(date);

  static String formatMonthYear(DateTime date) => _monthYearFormat.format(date);

  static String formatWeekday(DateTime date) => _weekdayFormat.format(date);

  static String formatShortWeekday(DateTime date) =>
      _shortWeekdayFormat.format(date);

  static String formatIsoDate(DateTime date) => _isoDateFormat.format(date);

  static String formatIsoDateTime(DateTime date) =>
      _isoDateTimeFormat.format(date.toUtc());

  static DateTime? parseIsoDate(String date) =>
      DateFormat('yyyy-MM-dd').tryParse(date);

  static DateTime? parseIsoDateTime(String date) =>
      DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").tryParse(date);

  static DateTime startOfWeek(DateTime date) {
    final diff = date.weekday - DateTime.monday;
    return DateTime(date.year, date.month, date.day - diff);
  }

  static DateTime endOfWeek(DateTime date) {
    final diff = DateTime.sunday - date.weekday;
    return DateTime(date.year, date.month, date.day + diff, 23, 59, 59);
  }

  static DateTime startOfMonth(DateTime date) =>
      DateTime(date.year, date.month, 1);

  static DateTime endOfMonth(DateTime date) =>
      DateTime(date.year, date.month + 1, 0, 23, 59, 59);

  static DateTime startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static DateTime endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59);

  static DateTime startOfYear(DateTime date) => DateTime(date.year, 1, 1);

  static DateTime endOfYear(DateTime date) =>
      DateTime(date.year, 12, 31, 23, 59, 59);

  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      final m = diff.inMinutes;
      return '$m ${m == 1 ? 'minute' : 'minutes'} ago';
    } else if (diff.inHours < 24) {
      final h = diff.inHours;
      return '$h ${h == 1 ? 'hour' : 'hours'} ago';
    } else if (diff.inDays < 7) {
      final d = diff.inDays;
      return '$d ${d == 1 ? 'day' : 'days'} ago';
    } else if (diff.inDays < 30) {
      final w = diff.inDays ~/ 7;
      return '$w ${w == 1 ? 'week' : 'weeks'} ago';
    } else if (diff.inDays < 365) {
      final m = diff.inDays ~/ 30;
      return '$m ${m == 1 ? 'month' : 'months'} ago';
    } else {
      final y = diff.inDays ~/ 365;
      return '$y ${y == 1 ? 'year' : 'years'} ago';
    }
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    final weekStart = startOfWeek(now);
    final weekEnd = endOfWeek(now);
    return date.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
        date.isBefore(weekEnd.add(const Duration(seconds: 1)));
  }

  static bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }

  static List<DateTime> getWeekDays(DateTime weekStart) {
    return List.generate(7, (i) => weekStart.add(Duration(days: i)));
  }

  static int daysBetween(DateTime from, DateTime to) {
    final f = DateTime(from.year, from.month, from.day);
    final t = DateTime(to.year, to.month, to.day);
    return t.difference(f).inDays;
  }
}
