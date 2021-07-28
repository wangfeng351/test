import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/http/http_net.dart';
import 'package:flutter_scaffold_demo/utils/screen_utils.dart';
import 'package:flutter_scaffold_demo/views/index.dart';
import 'package:flutter_scaffold_demo/views/testB.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  _initHttpRequest();
  runApp(MyApp());
}

_initHttpRequest() {
  /// 创建响应格式实体
  HttpResponseFormat responseFormat = HttpResponseFormat();

  /// code键名
  responseFormat.codeKey = 'code';

  /// 表示返回成功的code值
  responseFormat.successCodeValue = '1';

  /// data键名
  responseFormat.dataKey = 'data';

  /// 提示信息键名
  responseFormat.msgKey = 'msg';

  /// token键名
  responseFormat.tokenKey = 'token';

  /// 基础url
  String baseUrl = "http://yapi.njbandou.com/mock";

  Map commonParam = Map();
  commonParam['platform'] = "phone";
  commonParam['version'] = "1.0";
  commonParam['userId'] = "";
  commonParam['deviceNum'] = "1111";

  /// 初始化请求类，传入接收超时时间，连接超时时间，基础url及响应类型
  Request.init(
      receiveTimeOut: 5000,
      connectTimeOut: 5000,
      baseUrl: baseUrl,
      responseFomart: responseFormat,
      commonParam: commonParam);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1080, 1334),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: IndexPage()));
    // home: TestBPage());
  }
}
