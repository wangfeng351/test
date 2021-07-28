import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/common_widgets/ssy_banner.dart';
import 'package:flutter_scaffold_demo/routes/routes.dart';
import 'package:flutter_scaffold_demo/views/custom_scaffold.dart';
import 'package:flutter_scaffold_demo/views/testA.dart';

class TestBPage extends StatefulWidget {
  @override
  _TestBPageState createState() => _TestBPageState();
}

class _TestBPageState extends State<TestBPage> {
  String name = "hello";
  List<String> list = [
    "https://img95.699pic.com/photo/50046/5562.jpg_wh300.jpg",
    "http://static.runoob.com/images/demo/demo2.jpg",
    "https://pic.qqtn.com/up/2019-9/15690311636958128.jpg",
    "https://img-blog.csdnimg.cn/img_convert/47e58c1644b4bd97a2b7bef20aaa981a.png"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestB页面"),
      ),
      body: SsyBanner(
        list,
        onTap: test,
      ),
    );
  }

  //方法测试
  test(value) {
    print("回调的出内容是-------" + value);
  }
}
