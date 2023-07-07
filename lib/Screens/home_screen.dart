import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ravikanth_sir/Screens/chatting_window.dart';
import 'package:ravikanth_sir/Screens/contacts_screen.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactListPage(
                  onContactSelected: (Contact) {},
                ),
              ),
            );
          },
          child: Icon(Icons.edit, color: Colors.white),
          backgroundColor: Colors.pink,
          elevation: 4.0,
          shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.3);
              },
              shrinkWrap: true,
              itemCount: chat.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChattingWindow(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: size.height * 0.06,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(CupertinoIcons.person),
                      ),
                      title: Text(chat[index]["username"]),
                      subtitle: Text(
                        chat[index]["recent-msg"],
                        maxLines: 1,
                      ),
                      trailing: Text(
                        '12:34 PM',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
