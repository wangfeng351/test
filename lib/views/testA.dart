import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/http/http_net.dart';
import 'package:flutter_scaffold_demo/utils/index.dart';
import 'package:flutter_scaffold_demo/utils/time_utils.dart';

class TestAPage extends StatefulWidget {
  @override
  _TestAPageState createState() => _TestAPageState();
}

class _TestAPageState extends State<TestAPage> {
  @override
  void initState() {
    print("获取当前时间戳并格式化");
    // print(TimeUtils.dateFormatHHMMSS(DateTime.now()));
    print(TimeUtils.strFormatHHMMSS("2017-10-12 12:00:10"));
    // _getData();
    _postRequestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: Text("测试A"),
      // color: Colors.red,
      appBar: AppBar(
        title: Text("TestA页面"),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () async {
            // var obj = {'hello': "name"};
            var str = await CacheUtils.getString("test");
            LogUtils.i(str, tag: "测试数据");
          },
          child: Container(
            child: Text("点击我"),
          ),
        ),
      ),
    );
  }

  saveData() async {
    await CacheUtils.save("test", "测试内容是");
  }

  getData() async {
    String? str = await CacheUtils.getString("test");
    print("获取到CacheUtils中存储的数据$str");
  }

  _getData() {
    Map<String, dynamic> map = Map();
    map['districtCode'] = "";
    Request.get("/1104/user/getStreet", params: map)
        .then((value) => print(value))
        .catchError((onError) {
      print("错误信息是: $onError");
    });
  }

  _postRequestData() {
    var param = {'phone': "14752191468", "password": "123546"};
    Request.post("/1104/user/login", data: param)
        .then((value) => print(value))
        .catchError((onError) => print(onError));
  }
}
