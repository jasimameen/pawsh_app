import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../contacts/pages/contacts_page.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  final List<Widget> data = const [
    Center(child: Text('Home')),
    Center(child: Text('Calender')),
    Center(child: Text('Chat')),
    ContactsPage(),
    Center(child: Text('Settings')),
  ];

  final items = const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.calendar),
      label: "Calender",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.text_bubble),
      label: "Chat",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person_2),
      label: "Contacts",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.gear),
      label: "Settings",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 3,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        items: items,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return data[index];
          },
        );
      },
    );
  }
}
