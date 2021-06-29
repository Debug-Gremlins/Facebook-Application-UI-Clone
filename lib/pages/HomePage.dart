import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/database/data.dart';
import 'package:facebook_ui_clone/widgets/create-post-container.dart';
import 'package:facebook_ui_clone/widgets/custom-button.dart';
import 'package:facebook_ui_clone/widgets/rooms.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CustomButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () {},
              ),
              CustomButton(
                icon: Icons.message,
                iconSize: 30.0,
                onPressed: () {},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          )
        ],
      ),
    );
  }
}
