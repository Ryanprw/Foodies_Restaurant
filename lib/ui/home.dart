import 'package:flutter/material.dart';
import 'package:restauran_app/ui/favorite.dart';
import 'package:restauran_app/ui/list_screen.dart';
import 'package:restauran_app/ui/setting.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> body = <Widget>[
    const ListScreen(),
    const FavoriteScreen(),
    const Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.white,
                  )
                ],
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
                shadows: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black,
                  )
                ],
              ),
              label: 'favorit',
              activeIcon: Icon(
                Icons.favorite_outlined,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black87,
            ),
            label: 'settings',
            activeIcon: Icon(
              Icons.settings_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
