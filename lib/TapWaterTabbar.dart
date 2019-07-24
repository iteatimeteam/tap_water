import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/tap_water_tab_bar.dart';

import 'firstvc.dart';

//enum ActionsItems {
//  Group_chat,
//  Add_friend,
//  Scan,
//  Payment,
//}

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView({
    Key key,
    String title,
    Widget icon,
    Widget avtiveIcon,
  }) : item = new BottomNavigationBarItem(
          icon: icon,
          activeIcon: avtiveIcon,
          title: new Text(title),
          backgroundColor: Colors.white,
        );
}

class TapWaterTabbar extends StatefulWidget {
  final bool isButton;
  final List<Map<String, dynamic>> btmNavbar;
  final Function onTabClick;
  TapWaterTabbar({this.btmNavbar, this.isButton = false, this.onTabClick}) {
    final int _len = this.btmNavbar.length;
    // final int _len = 5;
    if (this.isButton) {
      if (_len % 2 == 0) {
        this.btmNavbar.insert(_len ~/ 2, null);
      } else {
        this.btmNavbar.insert(_len ~/ 2 + 1, null);
        this.btmNavbar.insert(_len ~/ 2 + 2, null);
      }
    }
  }

  @override
  _TapWaterTabbarState createState() => _TapWaterTabbarState();
}

class _TapWaterTabbarState extends State<TapWaterTabbar> {
  PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navgationViews;
  List<Widget> _pages;
  //添加图片地址,需要动态更换图片
  String bigImg = 'images/post_normal.png';
  int page = 0;
  @override
  void initState() {
    super.initState();
    _navgationViews = [
      NavigationIconView(
          title: '微信',
          icon: Icon(Icons.ac_unit),
          avtiveIcon: Icon(Icons.backspace)),
      NavigationIconView(
          title: '通讯录',
          icon: Icon(Icons.backup),
          avtiveIcon: Icon(Icons.cached)),
      NavigationIconView(
          title: '', icon: Icon(Icons.publish), avtiveIcon: Icon(Icons.public)),
      NavigationIconView(
          title: '发现',
          icon: Icon(Icons.dashboard),
          avtiveIcon: Icon(Icons.edit)),
      NavigationIconView(
        title: '我的',
        icon: Icon(Icons.memory),
        avtiveIcon: Icon(Icons.drive_eta),
      )
    ];

    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      DemoWidget("first"),
      DemoWidget("two"),
      DemoWidget("five"),
      DemoWidget("three"),
      DemoWidget("four"),
    ];
  }

  

  @override
  Widget build(BuildContext context) {
    final botNavbar = new BottomNavigationBar(
      fixedColor: Colors.green,
      items: _navgationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
    );
    return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: WaterTabBar(
                isButton: widget.isButton, btmNavbar: widget.btmNavbar),
          ),
        ],
      );
  }

  void onTap(int index) {
    if (index != 2) {
      setState(() {
        this.bigImg = 'images/post_normal.png';
      });
    } else {
      setState(() {
        this.bigImg = 'images/post_highlight.png';
      });
    }

    _pageController.jumpToPage(index);
  }

  //添加图片的点击事件
  void onBigImgTap() {
    setState(() {
      this.page = 2;
      this.bigImg = 'images/post_highlight.png';
      onTap(2);
    });
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
