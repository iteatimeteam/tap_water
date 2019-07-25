import 'package:flutter/material.dart';

class TabItemInfo {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final Color normalColor;
  int index;
  final Color selectedColor;
  TabItemInfo(
      {this.title,
      this.index,
      this.icon,
      this.activeIcon,
      this.normalColor = Colors.grey,
      this.selectedColor = Colors.blue});
}

class TabItem extends StatefulWidget {
  final TabItemInfo itemInfo;
  String get title {
    if (itemInfo != null) {
      return itemInfo.title;
    }
  }

  IconData get icon {
    if (itemInfo != null) {
      return itemInfo.icon;
    }
  }

  IconData get activeIcon {
    if (itemInfo != null) {
      return itemInfo.activeIcon;
    }
  }

  Color get selectedColor {
    if (itemInfo != null) {
      return itemInfo.selectedColor;
    }
  }

  Color get normalColor {
    if (itemInfo != null) {
      return itemInfo.normalColor;
    }
  }

  int get index {
    if (itemInfo != null) {
      return itemInfo.index;
    }
  }

  final Function onTabClick;
  final bool isSelected;
  TabItem({
    this.itemInfo,
    this.onTabClick,
    this.isSelected,
  });
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
                    : Container(),
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
    widget.onTabClick(widget.itemInfo);
  }
}
