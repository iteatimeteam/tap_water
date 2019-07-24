import 'package:flutter/material.dart';

class TabItemInfo {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final Color normalColor;
  int index;
  final Color selectedColor;
  TabItemInfo({this.title, this.index, this.icon, this.activeIcon, this.normalColor, this.selectedColor});
}

class TabItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final double width;
  final Function onTabClick;
  final int index;
  final IconData activeIcon;
  final bool isSelected;
  final Color selectedColor;
  final Color normalColor;
  TabItem(
      {this.title,
      this.icon,
      this.width,
      this.onTabClick,
      this.index,
      this.activeIcon,
      this.isSelected,
      this.normalColor = Colors.grey,
      this.selectedColor = Colors.blue});
  @override
  State<StatefulWidget> createState() => _TabItem();
}

class _TabItem extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    // final _themeColor = widget.isSelected ? widget.selectedColor : widget.normalColor;
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
                          child: Icon(
                            widget.isSelected ? widget.activeIcon : widget.icon,
                            color: widget.isSelected
                                ? widget.selectedColor
                                : widget.normalColor,
                          ),
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
                                  color: widget.isSelected
                                      ? widget.selectedColor
                                      : widget.normalColor,
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
