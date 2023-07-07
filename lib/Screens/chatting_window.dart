import 'package:flutter/material.dart';
import 'package:ravikanth_sir/Screens/home_screen.dart';

class ChattingWindow extends StatefulWidget {
  const ChattingWindow({super.key});

  @override
  State<ChattingWindow> createState() => _ChattingWindowState();
}

class _ChattingWindowState extends State<ChattingWindow> {
  List<String> messages = [];
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                ),
                CircleAvatar(),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vignesh Dusa",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: (value) {
                      setState(() {
                        messages.insert(0, value);
                      });
                      _messageController.clear(); // Clear the text field
                      // You can implement sending the message to the contact here
                    },
                    decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          iconSize: 25,
                          onPressed: () {
                            setState(() {
                              messages.insert(0, _messageController.text);
                            });
                            _messageController.clear(); // Clear the text field
                            // You can implement sending the message to the contact here
                          },
                        )),
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.send),
                //   onPressed: () {
                //     setState(() {
                //       messages.insert(0, _messageController.text);
                //     });
                //     _messageController.clear(); // Clear the text field
                //     // You can implement sending the message to the contact here
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
