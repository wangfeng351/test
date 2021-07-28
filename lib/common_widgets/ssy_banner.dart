import 'dart:async';

import 'package:flutter/material.dart';

class SsyBanner extends StatefulWidget {
  final List<String> images;
  final double height;
  final Curve curve;
  final Function? onTap;

  SsyBanner(this.images,
      {this.height = 200, this.curve = Curves.linear, this.onTap});

  @override
  _SsyBannerState createState() => _SsyBannerState();
}

class _SsyBannerState extends State<SsyBanner> {
  PageController? _pageController;
  // 当前图片的坐标
  int? _curIndex;
  // 定时器，切换图片
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _curIndex = widget.images.length;
    _pageController = PageController(initialPage: _curIndex!);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    var length = widget.images.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget.images.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 8,
                height: 8,
                color: s == widget.images[_curIndex! % length]
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 使用PageView构建轮播图
  Widget _buildPageView() {
    var length = widget.images.length;
    return Container(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _curIndex = index;
            if (index == 0) {
              _curIndex = length;
              // 切换图的同时刷新圆点
              _changePage();
            }
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanDown: (details) {
              _cancelTimer();
            },
            onTap: () {
              // 抛出每个图片的点击事件，返回每个item内容
              if (widget.onTap != null) {
                widget.onTap!(widget.images[index % length]);
              }
            },
            child: Image.network(
              widget.images[index % length],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  /// 点击到图片的时候取消定时任务
  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      _initTimer();
    }
  }

  /// 初始化定时任务
  _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 3), (t) {
        _curIndex = _curIndex! + 1;
        _pageController!.animateToPage(
          _curIndex!,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      });
    }
  }

  /// 切换页面，并刷新小圆点
  _changePage() {
    Timer(Duration(milliseconds: 350), () {
      _pageController!.jumpToPage(_curIndex!);
    });
  }
}
