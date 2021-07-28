import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/routes/routes.dart';
import 'package:flutter_scaffold_demo/views/custom_scaffold.dart';

class TestDPage extends StatefulWidget {
  final String? name;

  TestDPage({this.name});
  @override
  _TestDPageState createState() => _TestDPageState();
}

class _TestDPageState extends State<TestDPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: Text("TestD页面"),
        body: Column(
          children: [
            Container(
              child: Text("TestB页面传过来的内容是******************${widget.name}"),
            ),
            GestureDetector(
              onTap: () {
                Routes.pop(context, value: "TestD页面传输回来的内容");
              },
              child: Container(
                child: Text("返回上一页"),
              ),
            )
          ],
        ));
  }
}
