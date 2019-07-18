import 'package:flutter/material.dart';
import 'firstvc.dart';

enum ActionsItems {
  Group_chat,Add_friend,Scan,Payment
}

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, Widget icon, Widget avtiveIcon}) : 
  item = new BottomNavigationBarItem(
    icon: icon,
    activeIcon: avtiveIcon,
    title: new Text(title),
    backgroundColor: Colors.white
  );
}



class TapWaterTabbar extends StatefulWidget {
  @override
  _TapWaterTabbarState createState() => _TapWaterTabbarState();
}



class _TapWaterTabbarState extends State<TapWaterTabbar> {
  PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navgationViews;
  List<Widget> _pages;



  @override
  void initState() { 
    super.initState();
    _navgationViews = [
      NavigationIconView(title: '微信',icon: Icon(Icons.ac_unit),avtiveIcon: Icon(Icons.backspace)),
      NavigationIconView(title: '通讯录',icon: Icon(Icons.backup),avtiveIcon: Icon(Icons.cached)),
      NavigationIconView(title: '发现',icon: Icon(Icons.dashboard),avtiveIcon: Icon(Icons.edit)),
      NavigationIconView(title: '我的',icon: Icon(Icons.memory),avtiveIcon: Icon(Icons.email))
    ];
    _pageController = PageController(
      initialPage: _currentIndex
    );
    _pages = [
        DemoWidget("first"),
        DemoWidget("two"),
        DemoWidget("three"),
        DemoWidget("four"),
      ];
  }


  _buildPopupMenuItem(Widget icon, String title) {
    return Row(
      children: <Widget>[
        icon,
        Container(width: 3,),
        Text(title,style: TextStyle(color: Colors.white,),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final botNavbar = new BottomNavigationBar(
      fixedColor: Colors.green,
      items: _navgationViews
      .map((NavigationIconView navigationView) => navigationView.item).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
         _currentIndex = index;
         _pageController.animateToPage(_currentIndex,duration: 
         Duration(milliseconds: 200),curve: Curves.easeInOut);
        });
        print('点击了第$index');
      },
    );

    

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { print('xxx'); },
          ),
          Container(width: 5.0),
          PopupMenuButton(
            icon: Icon(Icons.add),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(child: _buildPopupMenuItem(Icon(Icons.search,color: Colors.white,), "发起群聊"),value: "group_chat",),
                PopupMenuItem(child: _buildPopupMenuItem(Icon(Icons.add_circle,color: Colors.white,), "添加朋友"),value: "add_friend",),
                PopupMenuItem(child: _buildPopupMenuItem(Icon(Icons.scanner,color: Colors.white,), "扫一扫"),value: "scan",),
                PopupMenuItem(child: _buildPopupMenuItem(Icon(Icons.payment,color: Colors.white,), "收付款"),value: "pay",),
              ];
            },
            onSelected: (String selected) {
              print('点击了$selected');
            },
          ),
          Container(width: 5.0)
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index){
          setState(() {
            _currentIndex = index;           
          });
        },
      ),
      bottomNavigationBar: botNavbar,
    );
  }
}