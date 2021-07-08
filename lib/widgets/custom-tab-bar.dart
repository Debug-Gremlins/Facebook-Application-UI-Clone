import 'package:facebook_ui_clone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  final bool isBottomIndicator;
  const CustomTabBar(
      {Key key,
      this.icons,
      this.selectedIndex,
      this.onTap,
      this.isBottomIndicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: isBottomIndicator
          ? BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 3.0)))
          : BoxDecoration(
              border: Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
