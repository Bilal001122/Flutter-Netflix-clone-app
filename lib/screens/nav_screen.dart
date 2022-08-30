import 'package:flutter/material.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  final List<Widget> _screens = [
    HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: widget._icons
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                    size: 30,
                  ),
                  label: title,
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
