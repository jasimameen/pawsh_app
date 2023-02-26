import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contacts/pages/contacts_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final List<Widget> pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Calender')),
    Center(child: Text('Chat')),
    ContactsPage(),
    Center(child: Text('Settings')),
  ];
  final tabs = const [
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

  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 3,
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(child: pages[_currentIndex]),

        //
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16),
          child: PhysicalModel(
            color: Colors.white,
            elevation: 10,
            borderRadius: BorderRadius.circular(60),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                items: tabs,
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
