import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;
  const CustomButton(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      @required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, right: 5),
      margin: EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
      child: IconButton(
          icon: Icon(
            icon,
            color: Colors.black87,
            size: iconSize,
          ),
          onPressed: onPressed),
    );
  }
}
