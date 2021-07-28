import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  //路由跳转
  static void push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  //路由跳转并获取到路由返回的数据
  static void pushAndBack(BuildContext context, Widget page,
      {Function? callBack}) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    })).then((value) {
      if (value != null) {
        callBack!(value);
      }
    });
  }

  //跳转路由并清除之前路由
  static void pushAndRemove(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return page;
      // ignore: unnecessary_null_comparison
    }), (route) => route == null);
  }

  //路由返回
  static void pop(BuildContext context, {value}) {
    Navigator.pop(context, value ?? null ? '' : value);
  }
}
