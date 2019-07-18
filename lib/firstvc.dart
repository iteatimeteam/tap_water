import 'package:flutter/material.dart';
import 'dart:async';

class DemoWidget extends StatelessWidget {
  final String text;

  DemoWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Center(child: Text(text ?? "这是无状态demo",style: TextStyle(fontSize: 20),),)
    );
  }
}

class DemoStateWidget extends StatefulWidget {
  final String text;
  ////通过构造方法传值
  DemoStateWidget(this.text);



  ///主要是负责创建state
  @override 
  _DemoStateWidgetState createState() => _DemoStateWidgetState(text);

}


class _DemoStateWidgetState extends State<DemoStateWidget> {
  String text;
  _DemoStateWidgetState(this.text);

  @override
  void initState() { // 初始化，理论上只有初始化一次
    // TODO: implement initState
    print("调用了初始化");
    super.initState();

    new Future.delayed(const Duration(seconds: 1),() {
      setState(() {
        text = "值变了";
      });
    });

  }

  @override
  void dispose() {
    ///销毁
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(text ?? "这就是有状态的Demo"),
    );
  }
}
