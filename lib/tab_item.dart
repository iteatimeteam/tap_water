import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  final String title;
  final Icon icon;
  final double width;
  TabItem({this.title, this.icon, this.width});
  @override
  State<StatefulWidget> createState() => _TabItem();
}

class _TabItem extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: widget.icon != null
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: IconButton(icon: widget.icon, color: Color(0xFF8c77ec), onPressed: null),
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
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
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
    );
  }
}
