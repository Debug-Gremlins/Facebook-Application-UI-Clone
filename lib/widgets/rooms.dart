import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({Key key, this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            Responsive.isDesktop(context) ? BorderRadius.circular(5) : null,
      ),
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 7.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 7.0),
                  child: _CreateRoomButton());
            } else {
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 7.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blue, width: 2.5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      child: Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (rect) =>
          //       Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          SizedBox(
            width: 6.0,
          ),
          Text(
            "Create\nRoom",
            style: TextStyle(color: Colors.grey[800]),
          )
        ],
      ),
    );
  }
}
