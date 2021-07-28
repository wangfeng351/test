class LogUtils {
  // Debug调试下的打印
  static void d(message, {tag}) {
    _printLog(tag, 'D -> ', message ??= "");
  }

  // 打印重要日志信息
  static void i(message, {tag}) {
    _printLog(tag, 'I -> ', message ??= "");
  }

  // 打印异常信息，e为抛出的异常
  static void e(message, {Exception? e, tag}) {
    _printLog(tag, 'E -> ', message ??= "");
  }

  static void _printLog(String? tag, String level, Object message) {
    StringBuffer sb = new StringBuffer();
    sb..write(level)..write(tag ?? '')..write(': ')..write(message);
    print(sb.toString());
  }
}
