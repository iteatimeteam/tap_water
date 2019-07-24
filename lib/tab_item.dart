import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  final String title;
  final Icon icon;
  final double width;
  final Function onTabClick;
  final int index;
  final Icon activeIcon;
  final bool isActive;
  TabItem(
      {this.title,
      this.icon,
      this.width,
      this.onTabClick,
      this.index,
      this.activeIcon,
      this.isActive});
  @override
  State<StatefulWidget> createState() => _TabItem();
}

class _TabItem extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: _onTab,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: widget.icon != null
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: IconButton(
                              icon: widget.isActive
                                  ? widget.activeIcon
                                  : widget.icon,
                              onPressed: null),
                        ),
                      )
                    : Container(
                        width: widget.width,
                      ),
              ),
              Flexible(
                child: Container(
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: widget.title != null
                          ? Text(
                              widget.title,
                              style: TextStyle(
                                  color: widget.isActive
                                      ? Colors.green
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10),
                            )
                          : Container(),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _onTab() {
    widget
        .onTabClick({'icon': widget.icon, 'title': widget.title}, widget.index);
  }
}
