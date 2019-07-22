import 'package:flutter/material.dart';
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
      home: TapWaterTabbar(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//const Color ContentColor = Color.fromARGB(255, 170, 170, 170);
//
//Widget contentWidget({double height}) {
//  return Container(
//    margin: const EdgeInsets.all(10),
//    color: Color.fromARGB(255, 170, 170, 170),
//    width: 25,
//    height: height,
//  );
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Listener(
//        onPointerDown: (PointerDownEvent event) {
//          print('Gesture3');
//        },
//        child: SizedBox(
//          width: 200,
//          height: 200,
//          child: GestureDetector(
//            onTap: () {
//              print('Gesture2');
//            },
//            child: SizedBox(
//              width: 100,
//              height: 100,
//              child: Listener(
//                onPointerDown: (PointerDownEvent event) {
//                  print('Gesture1');
//                },
//                child: SizedBox(
//                  width: 50,
//                  height: 50,
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
