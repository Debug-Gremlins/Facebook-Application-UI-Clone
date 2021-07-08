import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final bool isActive;
  final String imageUrl;
  const ProfileAvatar({Key key, this.isActive = false, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.grey,
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
      Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white)),
          ))
    ]);
  }
}
