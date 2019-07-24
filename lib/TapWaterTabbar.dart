import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/tab_item.dart';
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
  final List<TabItemInfo> tabItems;
  TapWaterTabbar({this.tabItems, this.isButton = false}) {
//    final int _len = this.btmNavbar.length;
//    // final int _len = 5;
//    if (this.isButton) {
//      if (_len % 2 == 0) {
//        this.btmNavbar.insert(_len ~/ 2, null);
//      } else {
//        this.btmNavbar.insert(_len ~/ 2 + 1, null);
//        this.btmNavbar.insert(_len ~/ 2 + 2, null);
//      }
//    }
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

    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      DemoWidget("first"),
      DemoWidget("two"),
      DemoWidget("five"),
      DemoWidget("three"),
      DemoWidget("four"),
    ];
  }

  _buildPopupMenuItem(Widget icon, String title) {
    return Row(
      children: <Widget>[
        icon,
        Container(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('xxx');
            },
          ),
          Container(width: 5.0),
          PopupMenuButton(
            icon: Icon(Icons.add),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      "发起群聊"),
                  value: "group_chat",
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(
                      Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      "添加朋友"),
                  value: "add_friend",
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(
                      Icon(
                        Icons.scanner,
                        color: Colors.white,
                      ),
                      "扫一扫"),
                  value: "scan",
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(
                      Icon(
                        Icons.payment,
                        color: Colors.white,
                      ),
                      "收付款"),
                  value: "pay",
                ),
              ];
            },
            onSelected: (String selected) {
              print('点击了$selected');
            },
          ),
          Container(width: 5.0)
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _pages[index];
              },
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: WaterTabBar(
              isButton: widget.isButton,
              tabItemInfos: widget.tabItems,
              selectedCallback: (int index) {
                print(index);
              },
            ),
          ),
        ],
      ),
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
