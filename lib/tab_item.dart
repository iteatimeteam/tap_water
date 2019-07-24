import 'package:flutter/material.dart';

class TabItemInfo {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final Color normalColor;
  final Color selectedColor;
  TabItemInfo({this.title, this.icon, this.activeIcon, this.normalColor, this.selectedColor});
}

class TabItem extends StatefulWidget {
  final TabItemInfo itemInfo;

  Color get normalColor => itemInfo.normalColor;
  Color get selectedColor => itemInfo.selectedColor;
  String get title => itemInfo.title;
  IconData get icon => itemInfo.icon;
  IconData get activeIcon => itemInfo.activeIcon;
  final bool selected;
  final VoidCallback callback;
  TabItem({this.itemInfo, this.selected = false, this.callback});

  @override
  State<StatefulWidget> createState() => _TabItem();
}

class _TabItem extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    final Color themeColor = widget.selected ? widget.selectedColor : widget.normalColor;
    final Icon icon = widget.icon != null
        ? widget.selected
            ? Icon(
                widget.activeIcon ?? widget.icon,
                color: widget.selectedColor,
              )
            : Icon(
                widget.icon,
                color: widget.normalColor,
              )
        : null;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (widget.callback != null) {
            widget.callback();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: icon != null
                      ? Container(
                          child: Padding(padding: const EdgeInsets.only(top: 5), child: icon),
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
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, color: themeColor),
                              )
                            : Container(),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
