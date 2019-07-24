import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/tab_item.dart';

const double TabBarHeight = 60.0;
const String bigImg = 'images/post_normal.png';
typedef WaterTabBarSelectedCallback = Function(int selectedPos);

class WaterTabBarController extends ValueNotifier<int> {
  WaterTabBarController(int selectedIndex) : super(selectedIndex);
}

class WaterTabBar extends StatefulWidget {
  final bool isButton;
  final List<TabItemInfo> tabItemInfos;
  final int selectedIndex;
  final WaterTabBarController waterTabBarController;
  final WaterTabBarSelectedCallback selectedCallback;
  WaterTabBar(
      {this.tabItemInfos = const <TabItemInfo>[],
      this.isButton = false,
      this.waterTabBarController,
      this.selectedIndex = 0,
      this.selectedCallback});

  @override
  State<StatefulWidget> createState() => _WaterTabBarState();
}

class _WaterTabBarState extends State<WaterTabBar> {
  WaterTabBarController _controller;
  int _selectedIndex;
  int _prevSelectedIndex;

  void _changeSelectedIndex() => _setSelectedIndex(_controller.value);

  @override
  void initState() {
    super.initState();
    _selectedIndex = _prevSelectedIndex = widget.selectedIndex;
    _controller =
        widget.waterTabBarController != null ? widget.waterTabBarController : WaterTabBarController(_selectedIndex);
    _controller.addListener(_changeSelectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: TabBarHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.tabItemInfos
                .asMap()
                .map((int index, TabItemInfo item) => MapEntry(
                    index,
                    TabItem(
                      itemInfo: item,
                      selected: _controller.value == index,
                      callback: () {
                        _controller.value = index;
                        setState(() {});
                      },
                    )))
                .values
                .toList(),
          ),
        ),
        Positioned(
          child: widget.isButton
              ? Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 60,
                  child: Image.asset(bigImg),
                )
              : Text(''),
        )
      ],
    );
  }

  void _setSelectedIndex(int index) {
    _prevSelectedIndex = _selectedIndex;
    _selectedIndex = index;
    if (widget.selectedCallback != null) {
      widget.selectedCallback(_selectedIndex);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_changeSelectedIndex);
  }
}
