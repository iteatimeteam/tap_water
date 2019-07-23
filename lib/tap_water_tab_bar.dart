import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/tab_item.dart';

const String bigImg = 'images/post_normal.png';

class WaterTabBar extends StatefulWidget {
  final bool isButton;
  List<Map<String, dynamic>> btmNavbar = [];
  WaterTabBar({this.btmNavbar, this.isButton = false});
  @override
  State<StatefulWidget> createState() => _WaterTabBarState();
}

class _WaterTabBarState extends State<WaterTabBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.btmNavbar
                .map((v) =>  v != null ? TabItem(title: v['title'], icon: v['icon']) : (widget.isButton ? TabItem() : Text('')))
                .toList() /* [
              TabItem(title: '微信', icon: Icon(Icons.ac_unit)),
              TabItem(title: '微信', icon: Icon(Icons.ac_unit)),
              widget.isButton ? TabItem() : Text(''),
              TabItem(title: '微信', icon: Icon(Icons.ac_unit)),
              TabItem(title: '微信', icon: Icon(Icons.ac_unit))
            ] */
            ,
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
//        IgnorePointer(
//          child: Container(
//            decoration: const BoxDecoration(color: Colors.transparent),
//            child: Align(
//              heightFactor: 1,
//              child: OverflowBox(
//                child: ,
//              ),
//            ),
//          ),
//        )
      ],
    );
  }
}
