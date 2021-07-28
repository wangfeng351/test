import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/views/custom_scaffold.dart';
import 'package:flutter_scaffold_demo/views/testA.dart';
import 'package:flutter_scaffold_demo/views/testB.dart';
import 'package:flutter_scaffold_demo/views/testC.dart';
import 'package:flutter_scaffold_demo/views/testD.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List bottomList = [
    {
      'icon': 'assets/images/shouye0.png',
      'size': 20.0,
      'label': '首页',
      'activeIcon': 'assets/images/shouye1.png'
    },
    {
      'icon': 'assets/images/zhishiku0.png',
      'size': 20.0,
      'label': '知识库',
      'activeIcon': 'assets/images/zhishiku1.png'
    },
    {
      'icon': 'assets/images/jiaoliu0.png',
      'size': 20.0,
      'label': '交流',
      'activeIcon': 'assets/images/jiaoliu1.png'
    },
    {
      'icon': 'assets/images/wode0.png',
      'size': 20.0,
      'label': '我的',
      'activeIcon': 'assets/images/wode1.png'
    },
  ];
  List bottomViews = [TestAPage(), TestBPage(), TestCPage(), TestDPage()];
  List topChilds = [];

  @override
  void initState() {
    // tabbarList.forEach((element) {
    //   topChilds.add(_buildTabContainer());
    // });
    // Toast.showSuccess(context, "成功");
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // title: Text("哈喽，测试"),
      // color: Colors.red,
      body: Container(),
      // bottomIcons: ,
      bottomIcons: bottomList,
      pageViews: bottomViews,
      // bottomNavigation: ,
    );
  }

  _buildTabContainer() {
    return Container(
      child: Text("第一个tab"),
    );
  }
}
