import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ravikanth_sir/data/data.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({Key? key}) : super(key: key);

  @override
  State<ChatUserCard> createState() => ChatUserCardState();
}

class ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 0.7,
        );
      },
      itemCount: chat.length,
      itemBuilder: (context, index) {
        Card(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 16.0,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blue, // Set custom background color
                radius: 20.0, // Adjust size
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                chat[index]["username"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                chat[index]["recent-msg"],
                maxLines: 1,
              ),
              trailing: Text(
                '12:34 PM',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        );
        return null;
      },
    );
  }
}
