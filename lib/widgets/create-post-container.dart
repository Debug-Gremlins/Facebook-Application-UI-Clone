import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                    decoration: InputDecoration.collapsed(
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                )),
              ),
            ],
          ),
          Divider(
            height: 10.0,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text('Live', style: TextStyle(color: Colors.black))),
              VerticalDivider(
                width: 8.0,
                thickness: 1.6,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Photo',
                    style: TextStyle(color: Colors.black),
                  )),
              VerticalDivider(
                width: 8.0,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text('Room', style: TextStyle(color: Colors.black))),
              VerticalDivider(
                width: 8.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
