import 'package:flutter/material.dart';
import 'widget/navigation_bar.dart';
// import 'TapWaterTabbar.dart';
import 'tap_water_tab_bar.dart';
import './tab_item.dart';

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
        home: _MyAppPage());
  }
}

class _MyAppPage extends StatefulWidget {
  _MyAppPage({Key key}) : super(key: key);

  @override
  _MyAppPageState createState() => new _MyAppPageState();
}

class _MyAppPageState extends State<_MyAppPage> {
  int _index = 0;
  var _pages = [
    Align(
      alignment: Alignment.center,
      child: Text('页面1'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面2'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面3'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面4'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面5'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavigationBar(),
        body: Stack(
          children: <Widget>[
            _pages[_index],
            WaterTabBar(
                isButton: true,
                btmNavbar: [
                  TabItemInfo(
                      title: '微信1',
                      icon: Icons.ac_unit,
                      activeIcon: Icons.backspace,
                      selectedColor: Colors.green),
                  TabItemInfo(
                      title: '微信2',
                      icon: Icons.ac_unit,
                      activeIcon: Icons.cached,
                      selectedColor: Colors.green),
                  TabItemInfo(
                      title: '微信3',
                      icon: Icons.ac_unit,
                      activeIcon: Icons.edit,
                      selectedColor: Colors.green),
                  TabItemInfo(
                      title: '微信4',
                      icon: Icons.ac_unit,
                      activeIcon: Icons.cached,
                      selectedColor: Colors.green),
                ],
                onTabClick: onTabClick),
          ],
        ));
  }

  void onTabClick(TabItemInfo node) {
    setState(() {
      _index = node.index;
    });
    print('$node');
  }
}
