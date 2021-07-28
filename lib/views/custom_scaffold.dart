import 'package:flutter/material.dart';
import 'package:flutter_scaffold_demo/utils/screen_utils.dart';

class CustomScaffold extends StatefulWidget {
  final showLeading;
  final action;
  final leading;
  final title;
  final pageViews;
  final body;
  final bottomViews;
  final bottomIcons;
  final bottomNavigation;
  final topViews;
  final topChilds;
  final centerTitle;
  final color;
  final bottomColor;
  CustomScaffold(
      {this.showLeading,
      this.action,
      this.leading,
      this.title,
      this.pageViews,
      this.body,
      this.bottomViews,
      this.bottomIcons,
      this.bottomNavigation,
      this.topViews,
      this.topChilds,
      this.centerTitle,
      this.color,
      this.bottomColor});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  List<BottomNavigationBarItem> bottommLists = [];
  TabController? tabController;
  bool _showLeading = true;
  bool? _centerTitle;
  int _topCurrentIndex = 0;

  @override
  void initState() {
    widget.showLeading == null
        ? _showLeading = true
        : _showLeading = widget.showLeading;
    widget.centerTitle == null ? _centerTitle = true : _centerTitle = false;
    if (widget.topViews != null) {
      tabController =
          TabController(length: widget.topViews.length, vsync: this);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != null
          ? AppBar(
              backgroundColor:
                  widget.color == null ? Colors.blue : widget.color,
              title: widget.title,
              centerTitle: _centerTitle,
              leading: _showLeading
                  ? widget.leading != null
                      ? widget.leading
                      : Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                        )
                  : null,
              // bottom: widget.topViews == null ? null : _buildTabBar(),
            )
          : null,
      body: widget.pageViews != null ? _buildPageViews() : widget.body,
      bottomNavigationBar: widget.bottomNavigation == null
          ? widget.bottomIcons != null
              ? _buildBottomNavigationBar()
              : null
          : widget.bottomNavigation,
    );
  }

  //构建顶部bar
  _buildTabBar() {
    List tabbars = widget.topViews;
    List<Widget> bars = [];
    tabbars.forEach((element) {
      bars.add(
        Tab(
          icon: Image.asset(element['icon'],
              width: element['size'], height: element['size']),
          text: element['label'],
          // child: widget.topChilds[_topCurrentIndex],
        ),
      );
    });
    return TabBar(
      controller: tabController,
      tabs: bars,
      onTap: _changeTabBarIndex,
    );
  }

  //构建pageViews切换页面
  _buildPageViews() {
    List pages = widget.pageViews;
    print("pages中的内容是: ");
    print(pages[0]);
    return PageView.builder(
        itemCount: pages.length,
        controller: _pageController,
        itemBuilder: (context, index) => pages[index]);
  }

  //构建底部bar
  _buildBottomNavigationBar() {
    return BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 14),
        unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 14),
        unselectedItemColor: Color(0xFF6d778b),
        selectedItemColor: Color(0xFF6d778b),
        onTap: _changeItem,
        items: _buildBottomIcons());
  }

  //构建底部bottom图标
  _buildBottomIcons() {
    List icons = widget.bottomIcons;
    bottommLists = [];
    icons.forEach((element) {
      bottommLists.add(
        BottomNavigationBarItem(
          icon: _buildBottomIconItem(element['icon'], element['size']),
          label: element['label'],
          backgroundColor:
              widget.bottomColor == null ? Colors.white : widget.bottomColor,
          activeIcon:
              _buildBottomIconItem(element['activeIcon'], element['size']),
        ),
      );
    });
    print("底部长度是: " + bottommLists.length.toString());
    return bottommLists;
  }

  //构建底部图标详情的item
  _buildBottomIconItem(icon, size) {
    return Container(
      width: ScreenUtils.getScaleW(context, size),
      height: ScreenUtils.getScaleW(context, size),
      child: Image.asset(
        icon,
        fit: BoxFit.contain,
      ),
      margin: EdgeInsets.only(bottom: 2),
    );
  }

  //切换页面
  _changeItem(index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  _changeTabBarIndex(index) {
    if (mounted) {
      setState(() {
        _topCurrentIndex = index;
      });
    }
  }
}
