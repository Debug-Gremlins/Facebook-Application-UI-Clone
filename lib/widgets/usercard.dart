import 'package:facebook_ui_clone/database/data.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(
          imageUrl: user.imageUrl,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          user.name,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        )
      ],
    );
  }
}
