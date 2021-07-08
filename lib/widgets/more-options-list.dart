import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid 19 Center']
  ];
  final User currentUser;

  const MoreOptionsList({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
