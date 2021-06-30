import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/database/data.dart';
import 'package:facebook_ui_clone/models/post_model.dart';
import 'package:facebook_ui_clone/widgets/create-post-container.dart';
import 'package:facebook_ui_clone/widgets/custom-button.dart';
import 'package:facebook_ui_clone/widgets/post-container.dart';
import 'package:facebook_ui_clone/widgets/rooms.dart';
import 'package:facebook_ui_clone/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                icon: MdiIcons.facebookMessenger,
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
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(
              post: post,
            );
          }, childCount: posts.length))
        ],
      ),
    );
  }
}
