import 'package:flutter/material.dart';

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView({
    Key key,
    final String title = '',
    final Widget icon,
    final Widget activeIcon,
  }) : item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Text(
            title,
          ),
          backgroundColor: Colors.white,
        );
}

class WaterTabBar extends StatefulWidget {
  /// 是否有加号按钮
  final bool isButton;

  /// appBar Widget
  final Widget appBar;

  /// 主体内容
  final Widget body;

  /// 底部按钮配置
  List<NavigationIconView> btmNavbar = [];

  /// 组件通信
  final Function onTabClick;

  /// 底部button选中颜色
  final Color selectedColor;

  /// +号按钮选中颜色
  final Color buttonSelectedColor;

  /// +号按钮索引
  int btnIndex;

  /// btmNavbar数组长度
  int len;
  WaterTabBar(
      {Key key,
      this.body,
      this.appBar,
      this.btmNavbar,
      this.selectedColor = Colors.blue,
      this.buttonSelectedColor = Colors.blue,
      this.isButton = false,
      this.onTabClick})
      : super(key: key) {
    // 解决tab为基数问题
    if (this.isButton) {
      this.len = this.btmNavbar.length;
      if (this.len % 2 == 0) {
        // btmNavbar偶数
        this.btnIndex = this.len ~/ 2;
        this.btmNavbar.insert(this.len ~/ 2,
            NavigationIconView(icon: Icon(Icons.ac_unit, size: 0)));
      } else {
        // btmNavbar基数
        this.btnIndex = this.len ~/ 2 + 1;
        this.btmNavbar.insert(this.len ~/ 2 + 1,
            NavigationIconView(icon: Icon(Icons.ac_unit, size: 0)));
        this
            .btmNavbar
            .add(NavigationIconView(icon: Icon(Icons.ac_unit, size: 0)));
      }
    }
  }
  @override
  State<StatefulWidget> createState() => _WaterTabBarState();
}

class _WaterTabBarState extends State<WaterTabBar> {
  /// 选中的索引
  int _activeIndex = 0;
  /// +号按钮背景色
  Color _addBgc = Colors.grey;

  @override
  Widget build(BuildContext context) {
    var _items = BottomNavigationBar(
      /// 底部导航栏
      items: widget.btmNavbar
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _activeIndex,
      fixedColor: widget.selectedColor,
      type: BottomNavigationBarType.fixed,
      onTap: _onTabClick,
    );
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: _items,
      floatingActionButton: widget.isButton
          ? FloatingActionButton(
              elevation: 6,
              highlightElevation: 6,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 36,
              ),
              onPressed: () {
                _onTabClick(widget.btnIndex);
              },
              shape: CircleBorder(
                  side: BorderSide(color: Colors.white, width: 3.5)),
              backgroundColor: _addBgc)
          : Text(''),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// 单击事件
  void _onTabClick(int index) {
    if (widget.isButton) {
      if (index == widget.len + 1) {
        index -= 1;
      }
      setState(() {
        _addBgc =
            index == widget.btnIndex ? widget.buttonSelectedColor : Colors.grey;
      });
    }
    setState(() {
      _activeIndex = index;
    });
    if (widget.onTabClick != null) {
      widget.onTabClick(_activeIndex);
    }
  }
}
