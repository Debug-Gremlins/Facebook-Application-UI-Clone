import 'package:facebook_ui_clone/database/data.dart';
import 'package:facebook_ui_clone/pages/HomePage.dart';
import 'package:facebook_ui_clone/widgets/cuatom-app-bar.dart';
import 'package:facebook_ui_clone/widgets/custom-tab-bar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.people,
    Icons.ondemand_video,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  child: CustomAppBar(
                      currentUser: currentUser,
                      icons: _icons,
                      selectedIndex: _selectedIndex),
                  preferredSize: Size(screenSize.width, 100))
              : null,
          body: _screen[_selectedIndex],
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index))
              : SizedBox.shrink(),
        ));
  }
}
