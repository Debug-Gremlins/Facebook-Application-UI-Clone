import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/database/data.dart';
import 'package:facebook_ui_clone/models/post_model.dart';
import 'package:facebook_ui_clone/widgets/contact-list.dart';
import 'package:facebook_ui_clone/widgets/create-post-container.dart';
import 'package:facebook_ui_clone/widgets/custom-button.dart';
import 'package:facebook_ui_clone/widgets/more-options-list.dart';
import 'package:facebook_ui_clone/widgets/post-container.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:facebook_ui_clone/widgets/rooms.dart';
import 'package:facebook_ui_clone/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenMobile({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          child: CreatePostContainer(currentUser: currentUser),
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
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: MoreOptionsList(),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Container(
            width: 600,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(
                      onlineUsers: onlineUsers,
                    ),
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
            )),
        Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: ContactList(users: onlineUsers),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
