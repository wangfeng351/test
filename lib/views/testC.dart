import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/routes/routes.dart';
import 'package:flutter_scaffold_demo/views/custom_scaffold.dart';
import 'package:flutter_scaffold_demo/views/testA.dart';
import 'package:flutter_scaffold_demo/views/testD.dart';

class TestCPage extends StatefulWidget {
  @override
  _TestCPageState createState() => _TestCPageState();
}

class _TestCPageState extends State<TestCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Testc页面"),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Routes.push(context, TestDPage());
              },
              child: Container(child: Text('普通跳转')),
            ),
            GestureDetector(
              onTap: () {
                Routes.pushAndBack(
                    context,
                    TestDPage(
                      name: "TestC页面传入的值",
                    ),
                    callBack: getCallBack);
              },
              child: Container(child: Text('跳转传参并获取返回值')),
            ),
            GestureDetector(
              onTap: () {
                Routes.pushAndRemove(context, TestDPage());
              },
              child: Container(child: Text('跳转后从路由栈中清除当前页面路由')),
            ),
          ],
        ));
  }

  //获取回调内容
  getCallBack(value) {
    print("返回的值是$value");
  }
}
