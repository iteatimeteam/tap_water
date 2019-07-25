import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text('微信'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('xxx');
          },
        ),
        Container(width: 5.0),
        PopupMenuButton(
          icon: Icon(Icons.add),
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<String>>[
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    "发起群聊"),
                value: "group_chat",
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    "添加朋友"),
                value: "add_friend",
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(
                      Icons.scanner,
                      color: Colors.white,
                    ),
                    "扫一扫"),
                value: "scan",
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                    "收付款"),
                value: "pay",
              ),
            ];
          },
          onSelected: (String selected) {
            print('点击了$selected');
          },
        ),
        Container(width: 5.0)
      ],
    );
  }

  _buildPopupMenuItem(Widget icon, String title) {
    return Row(
      children: <Widget>[
        icon,
        Container(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
