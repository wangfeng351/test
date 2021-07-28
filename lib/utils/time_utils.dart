import 'package:date_format/date_format.dart';

/*
 * 关于时间工具
 */
class TimeUtils {
  // 工厂模式
  factory TimeUtils() => _getInstance()!;

  static TimeUtils get instance => _getInstance()!;
  static TimeUtils? _instance;

  TimeUtils._internal() {
    // 初始化
  }

  static TimeUtils? _getInstance() {
    if (_instance == null) {
      _instance = new TimeUtils._internal();
    }
    return _instance;
  }

  // 时间格式化为时间戳
  static int dateTimeFormatMilliSec() {
    var nowTime = DateTime.now(); //获取当前时间
    return nowTime.millisecondsSinceEpoch; //单位是毫秒(千分之一秒)，13位时间戳
  }

  // DateTime格式化为HH:mm:ss
  static String dateFormatHHMMSS(DateTime date) {
    DateTime time = new DateTime(
        date.year, date.month, date.day, date.hour + 8, date.minute);
    return time.toString().substring(0, time.toString().lastIndexOf("."));
  }

  // 毫秒数转为HH:mm:ss
  static String milliFormatHHMMSS(milliSeconds) {
    DateTime time = new DateTime(milliSeconds);
    return dateFormatHHMMSS(time);
  }

  // 字符串格式化为HH:mm:ss
  static String strFormatHHMMSS(String timeStr) {
    DateTime date = DateTime.parse(timeStr);
    print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
    return dateFormatHHMMSS(date);
  }

  // 增加时间或减少时间, 正为增，负为减
  static DateTime addOrReduceTime(DateTime date, {day, hour, min, sec}) {
    return date.add(Duration(
        days: day ??= 0,
        hours: hour ??= 0,
        minutes: min ??= 0,
        seconds: sec ??= 0));
  }

  // DateTime格式化为星期几
  static String dateTimeFormatWeek(DateTime date) {
    var week = date.weekday;
    String w = '';
    switch (week.toString()) {
      case '1':
        w = '一';
        break;
      case '2':
        w = '二';
        break;
      case '3':
        w = '三';
        break;
      case '4':
        w = '四';
        break;
      case '5':
        w = '五';
        break;
      case '6':
        w = '六';
        break;
      case '7':
        w = '日';
        break;
    }
    return '周' + w.toString();
  }
}

class TimeData {
  String? dataTime;
  int? week;
}
