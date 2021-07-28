import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  //定义权限状态码变量
  static PermissionStatus? _status;

  static Future<bool> checkContactPermission(Permission permission) async {
    bool result = true;
    if (await permission.isDenied) {
      print("进入权限申请");
      //未开通权限，申请权限
      _status = await permission.request();
    } else {
      //权限已开通
      result = true;
    }
    //拒绝使用权限
    if (_status!.isDenied) {
      result = false;
    }
    //允许使用使用权限
    if (_status!.isGranted) {
      result = true;
    }
    //返回申请权限结果
    return result;
  }
}
