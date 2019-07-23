import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/tab_item.dart';

const String bigImg = 'images/post_normal.png';

class WaterTabBar extends StatefulWidget {
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
            boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TabItem(title: '微信', icon: Icon(Icons.ac_unit)),
              TabItem(title: '微信', icon: Icon(Icons.ac_unit)),
              TabItem(),
              TabItem(title: '微信', icon: Icon(Icons.ac_unit)),
              TabItem(title: '微信', icon: Icon(Icons.ac_unit))
            ],
          ),
        ),
        Positioned(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 60,
            child: Image.asset(bigImg),
          ),
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
