import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/custom-button.dart';
import 'package:facebook_ui_clone/widgets/custom-tab-bar.dart';
import 'package:facebook_ui_clone/widgets/usercard.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final User currentUser;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  const CustomAppBar(
      {Key key,
      this.icons,
      this.currentUser,
      this.selectedIndex,
      this.onTap,
      this.isBottomIndicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4.0)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                SizedBox(
                  width: 12.0,
                ),
                CustomButton(
                    icon: Icons.search, onPressed: () {}, iconSize: 30.0),
                CustomButton(
                    icon: MdiIcons.facebookMessenger,
                    onPressed: () {},
                    iconSize: 30.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
