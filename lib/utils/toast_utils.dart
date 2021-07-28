import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scaffold_demo/utils/my_loading.dart';

/// Toast工具类
class Toast {
  OverlayEntry? _overlayEntry;
  Timer? _timer;

  OverlayEntry get overlayEntry => _overlayEntry!;

  Timer? get timer => _timer;

  /// 全局单例 每次使用如果生成则从缓存拿
  factory Toast() => _getInstance();

  static Toast? _instance;

  static Toast get instance => _getInstance();

  Toast._internal();

  static Toast _getInstance() {
    if (_instance == null) {
      _instance = Toast._internal();
    }
    return _instance!;
  }

  /// 加载中
  static void showLoading(BuildContext context, String message) {
    dismiss();
    var fadingCircle = CupertinoActivityIndicator(animating: true, radius: 20);
    _getInstance()._show(context, message, fadingCircle, 100000);
  }

  /// 成功
  static void showSuccess(BuildContext context, String message) {
    int time = 750 + (message.length) * 60;
    if (750 + (message.length) * 60 > 5000) {
      time = 5000;
    }
    var icon = Icon(
      Icons.check,
      size: 80.w,
      color: Colors.white,
    );
    _getInstance()._show(
      context,
      message,
      icon,
      time,
    );
  }

  /// 错误
  static void showError(BuildContext context, String message) {
    int time = 750 + (message.length) * 60;
    if (750 + (message.length) * 60 > 5000) {
      time = 5000;
    }
    var icon = Icon(
      Icons.clear,
      size: 80.w,
      color: Colors.white,
    );
    _getInstance()._show(
      context,
      message,
      icon,
      time,
    );
  }

  void _show(BuildContext context, String message, Widget icon, int time) {
    dismiss();
    OverlayEntry _overlayEntry = OverlayEntry(
      builder: (context) {
        return Scaffold(
          /// 键盘不影响布局
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: MyLoading(
            icon: icon,
            message: message,
            time: time,
          ),
        );
      },
    );

    //往Overlay中插入插入OverlayEntry
    Overlay.of(context)!.insert(_overlayEntry);

    _getInstance()._overlayEntry = _overlayEntry;

    _getInstance()._timer =
        Timer.periodic(Duration(milliseconds: time), (Timer timer) {
      dismiss();
    });
  }

  void _showDialog(BuildContext context, Widget pattern) {
    OverlayEntry _overlayEntry = OverlayEntry(
      builder: (context) {
        return Scaffold(backgroundColor: Colors.transparent, body: pattern);
      },
    );

    //往Overlay中插入插入OverlayEntry
    Overlay.of(context)!.insert(_overlayEntry);

    _getInstance()._overlayEntry = _overlayEntry;
  }

  /// dismiss loading
  static void dismiss() async {
    _getInstance()._cancelTimer();
    _getInstance()._remove();
  }

  void _cancelTimer() {
    if (_getInstance().timer != null) {
      _getInstance().timer!.cancel();
      _getInstance()._timer = null;
    }
  }

  void _remove() {
    _getInstance().overlayEntry.remove();
    _getInstance()._overlayEntry = null;
  }
}
