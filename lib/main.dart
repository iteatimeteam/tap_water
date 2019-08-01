import 'package:flutter/material.dart';
import 'widget/navigation_bar.dart';
// import 'TapWaterTabbar.dart';
import 'tap_water_tab_bar.dart';

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
    Align(
      alignment: Alignment.center,
      child: Text('页面6'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return WaterTabBar(
        isButton: true,
        selectedColor: Colors.green,
        appBar: NavigationBar(),
        body: _pages[_index],
        btmNavbar: <NavigationIconView>[
          NavigationIconView(
            title: '微信1',
            icon: Icon(Icons.ac_unit),
            activeIcon: Icon(Icons.backspace),
          ),
          NavigationIconView(
            title: '微信2',
            icon: Icon(Icons.ac_unit),
            activeIcon: Icon(Icons.cached),
          ),
          NavigationIconView(
            title: '微信3',
            icon: Icon(Icons.ac_unit),
            activeIcon: Icon(Icons.edit),
          ),
          NavigationIconView(
            title: '微信4',
            icon: Icon(Icons.ac_unit),
            activeIcon: Icon(Icons.cached),
          ),
          // NavigationIconView(
          //   title: '微信6',
          //   icon: Icon(Icons.ac_unit),
          //   activeIcon: Icon(Icons.cached),
          // ),
        ],
        onTabClick: onTabClick);
  }

  void onTabClick(int index) {
    setState(() {
      _index = index;
    });
    print('$index');
  }
}
