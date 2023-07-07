import 'package:flutter/material.dart';
import 'package:ravikanth_sir/Screens/contacts_screen.dart';

class ChatingPage extends StatefulWidget {
  final Contact contact;

  const ChatingPage(
      {required this.contact, required List<Contact> selectedContacts});

  @override
  _ChatingPageState createState() => _ChatingPageState();
}

class _ChatingPageState extends State<ChatingPage> {
  List<String> messages = [];
  List<Contact> selectedContacts = [];
  TextEditingController _messageController = TextEditingController();
  bool isOne = false;
  String DisplayedName = '';

  void addContact(Contact contact) {
    setState(() {
      isOne = true;
      if (!DisplayedName.contains(contact.name)) {
        selectedContacts.add(contact);
        if (DisplayedName.isEmpty) {
          DisplayedName = contact.name;
        } else {
          DisplayedName = '$DisplayedName, ${contact.name}';
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    DisplayedName = widget.contact.name;
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _showContactList() async {
    final selectedContact = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactListPage(
          onContactSelected: (contact) {
            addContact(contact);
          },
        ),
      ),
    );

    // Handle selected contact if needed
    if (selectedContact != null) {
      addContact(selectedContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(isOne
            //     ? DisplayedName
            //     : DisplayedName = '${widget.contact.name},$DisplayedName'),
            //if (isOne && DisplayedName.isNotEmpty) Text(DisplayedName),
            Text(
              isOne ? DisplayedName : widget.contact.name,
            ),
            const Text(
              'Online',
              style: TextStyle(
                color: Colors.green,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add new logic here
              _showContactList();
            },
          ),
        ],
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
