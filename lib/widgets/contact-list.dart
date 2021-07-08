import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/usercard.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 280.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Contacts',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                )),
                Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey[600],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final User user = users[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                      child: UserCard(user: user),
                    );
                  }),
            )
          ],
        ));
  }
}
