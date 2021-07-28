import 'dart:convert';
import 'package:dio/dio.dart';

class Request {
  /// 响应格式
  static late HttpResponseFormat _responseFomart;

  /// 创建opt实例
  static late BaseOptions _options;

  /// 创建Dio实例
  static late Dio _dio;

  /// 公共参数
  static late Map _commonParam;

  /// 初始化dio基础配置
  static void init(
      {baseUrl,
      HttpResponseFormat? responseFomart,
      connectTimeOut = 5000,
      receiveTimeOut = 5000,
      commonParam}) {
    _options = BaseOptions(
      /// 基础url
      baseUrl: baseUrl,

      /// 超时时间
      connectTimeout: connectTimeOut,

      /// 接收响应时间
      receiveTimeout: receiveTimeOut,
    );

    /// 初始化响应类型
    _responseFomart = responseFomart!;

    /// 公共参数赋值
    _commonParam = commonParam;

    _commonParam.forEach((key, value) {
      _options.headers[key] = value;
    });

    /// 初始化dio
    _dio = Dio(_options);
  }

  /// _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path,
      {String? method,
      Map<String, dynamic>? params,
      data,
      bool? isHasToken}) async {
    _dio.options.headers['timeStamp'] = DateTime.now().millisecondsSinceEpoch;
    try {
      Response response = await _dio.request(path,
          queryParameters: params,
          data: data,
          options: Options(method: method));

      /// 响应状态
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          /// 判断返回的code与规定的successCode对比
          if (response.data[_responseFomart.codeKey].toString() !=
              _responseFomart.successCodeValue) {
            /// 返回异常处理
            return Future.error(response.data[_responseFomart.msgKey]);
          } else {
            if (isHasToken!) {
              var data = json.decode(response.data[_responseFomart.dataKey]);
              _dio.options.headers[_responseFomart.tokenKey!] =
                  data[_responseFomart.tokenKey];
              _dio.options.headers['userId'] = data['userId'];
            }
            if (response.data is Map) {
              return response.data[_responseFomart.dataKey];
            } else {
              return json
                  .decode(response.data[_responseFomart.dataKey].toString());
            }
          }
        } catch (e) {
          return Future.error('解析响应数据异常');
        }
      } else {
        _handleHttpError(int.parse(response.statusCode.toString()));
        return Future.error('HTTP错误');
      }
    } on DioError catch (e, s) {
      return Future.error(_dioError(e));
    } catch (e, s) {
      return Future.error('未知异常');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
      default:
        return "Dio异常";
    }
  }

  // 处理Http错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    print("请求异常$message");
  }

  /// get方法
  static Future<T> get<T>(String path,
      {Map<String, dynamic>? params, bool isHasToken = false}) {
    return _request(path,
        method: 'get', params: params, isHasToken: isHasToken);
  }

  /// post方法
  static Future<T> post<T>(String path,
      {Map<String, dynamic>? params, data, bool isHasToken = false}) {
    return _request(path,
        method: 'post', params: params, data: data, isHasToken: isHasToken);
  }
}

/// 指定返回响应格式
class HttpResponseFormat {
  String? codeKey;
  String? successCodeValue;
  String? dataKey;
  String? msgKey;
  String? tokenKey;
}
