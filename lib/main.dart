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
      alignment: Alignment.topLeft,
      child: Text('1'),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: Text('2'),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: Text('3'),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: Text('4'),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: Text('5'),
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
                  {
                    'title': '微信1',
                    'icon': Icon(Icons.ac_unit),
                    'avtiveIcon': Icon(Icons.backspace, color: Colors.green)
                  },
                  {
                    'title': '微信2',
                    'icon': Icon(Icons.ac_unit),
                    'avtiveIcon': Icon(Icons.cached, color: Colors.green)
                  },
                  {
                    'title': '微信3',
                    'icon': Icon(Icons.ac_unit),
                    'avtiveIcon': Icon(Icons.edit, color: Colors.green)
                  },
                   {
                    'title': '微信4',
                    'icon': Icon(Icons.ac_unit),
                    'avtiveIcon': Icon(Icons.cached, color: Colors.green)
                  },
                ],
                onTabClick: onTabClick),
          ],
        ));
  }

  void onTabClick(node, i) {
    setState(() {
      _index = i;
    });
    print('$node $i');
    // print('$node $index');
  }
}
