import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/models/day_model.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({Key key, @required this.currentUser, @required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            } else {
              final Story story = stories[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                child: _StoryCard(story: story),
              );
            }
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;
  final bool hasBorder;
  const _StoryCard(
      {Key key,
      this.isAddStory = false,
      this.currentUser,
      this.story,
      this.hasBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Positioned(
            top: 4.0,
            left: 4.0,
            child: isAddStory
                ? Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[100], shape: BoxShape.circle),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.add,
                        color: Palette.facebookBlue,
                      ),
                      onPressed: () {},
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                  )),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? 'Add Story' : story.user.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
