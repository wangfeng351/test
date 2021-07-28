import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLoading extends StatefulWidget {
  final Widget? icon;
  final String? message;
  final int? time;

  const MyLoading({Key? key, this.icon, this.message, this.time})
      : super(key: key);

  @override
  _MyLoadingState createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading> {
  bool? visible;

  @override
  void initState() {
    visible = false;

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        visible = !visible!;
      });
    });
    Future.delayed(Duration(milliseconds: widget.time! - 200)).then((value) {
      /// 可以判断Toast是否被消除
      if (mounted) {
        setState(() {
          visible = !visible!;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: visible! ? 1.0 : 0.0,
          duration: Duration(milliseconds: 100),
          child: Container(
            width: 200.w,
            height: widget.message == '' ? 200.w : 220.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 33, 33),
              borderRadius: BorderRadius.all(
                Radius.circular(20.sp),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.icon!,
                Divider(color: Colors.grey),
                widget.message == ''
                    ? Container()
                    : Text(
                        widget.message!,
                        maxLines: 3,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
