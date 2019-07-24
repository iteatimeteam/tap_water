import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/tab_item.dart';

import 'TapWaterTabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TapWaterTabbar(isButton: true, tabItems: [
        TabItemInfo(title: '微信', icon: Icons.ac_unit, selectedColor: Colors.blue),
        TabItemInfo(title: '微信', icon: Icons.ac_unit, selectedColor: Colors.blue),
        TabItemInfo(title: ''),
        TabItemInfo(title: '微信', icon: Icons.ac_unit, selectedColor: Colors.blue),
        TabItemInfo(title: '微信', icon: Icons.ac_unit, selectedColor: Colors.blue),
      ]),
    );
  }
}
