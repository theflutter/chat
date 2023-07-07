import 'package:flutter/material.dart';
import 'package:ravikanth_sir/Screens/chatting_page.dart';

class ContactListPage extends StatefulWidget {
  final Function(Contact) onContactSelected;

  ContactListPage({required this.onContactSelected});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final List<Contact> contacts = [
    Contact(name: 'Aamir', photoUrl: 'assets/amir kahn.jpg'),
    Contact(name: 'Alia', photoUrl: 'assets/1.jpg'),
    Contact(name: 'Arjun', photoUrl: 'assets/allu arjun.jpg'),
    Contact(name: 'Amith Shah', photoUrl: 'assets/amit shah.jpg'),
    Contact(name: 'Balayya Babu', photoUrl: 'assets/balaya babu.jpg'),
    Contact(name: 'CBN', photoUrl: 'assets/cbn.jpg'),
    Contact(name: 'God Father', photoUrl: 'assets/chiranjeevi.jpg'),
    Contact(name: 'CM Jagan', photoUrl: 'assets/jagan.jpg'),
    Contact(name: 'KTR', photoUrl: 'assets/ktr.jpg'),
    Contact(name: 'PM Modi', photoUrl: 'assets/modi.jpg'),
    Contact(name: 'RGV', photoUrl: 'assets/129.jpg'),
    Contact(name: 'SKY', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Suresh Raina', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Prathyaksh', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Prabhas', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Zain Malik', photoUrl: 'assets/129.jpg'),
    // Add more contacts here...
  ];

  List<Contact> selectedContacts = [];
  Color? selectedColor;
  Map<Contact, Color> contactColors = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search logic here
            },
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = Colors.red;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedColor == Colors.red
                    ? Colors.red
                    : Colors.transparent,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = Colors.green;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedColor == Colors.green
                    ? Colors.green
                    : Colors.transparent,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = Colors.blue;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedColor == Colors.blue
                    ? Colors.blue
                    : Colors.transparent,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final isSelected = selectedContacts.contains(contact);
          final selectedContactColor = contactColors[contact];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contact.photoUrl),
            ),
            title: GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedContacts.remove(contact);
                  } else {
                    selectedContacts.add(contact);
                  }
                  contactColors[contact] = selectedColor!;
                });
              },
              child: Text(
                contact.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isSelected ? selectedContactColor : null,
                ),
              ),
            ),
            trailing: isSelected
                ? Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedContactColor ?? selectedColor,
                    ),
                  )
                : null,
            tileColor: isSelected ? Colors.grey[300] : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          for (var contact in selectedContacts) {
            widget.onContactSelected(contact);
          }
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatingPage(
                selectedContacts: selectedContacts,
                contact: Contact(
                  name: selectedContacts
                      .map((contact) => contact.name)
                      .join(', '),
                  photoUrl: selectedContacts.isNotEmpty
                      ? selectedContacts[0].photoUrl
                      : '',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String photoUrl;

  Contact({required this.name, required this.photoUrl});
}
