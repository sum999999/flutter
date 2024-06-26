import 'package:flutter/material.dart';
import './page/find.dart';
import './page/friend.dart';
import './page/home.dart';
import './page/my.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Find Page'),
    Text('Friend Page'),
    Text('My Page'),
  ];
  static const List<Widget> _pages = <Widget>[ Home(), Find(), Friend(),My()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text('Home Page'),
      // ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_nav1.svg', width: 24, height: 24),
            activeIcon: Image.asset('images/welfareBg.png',
                width: 24, height: 24, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/welfareBg.png', width: 24, height: 24),
            activeIcon: Image.asset('images/welfareBg.png',
                width: 24, height: 24, color: Colors.black),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Image.network(
                'https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/dovf9udmncfetf2ahdpp.webp',
                width: 24,
                height: 24),
            activeIcon: Image.asset('images/welfareBg.png',
                width: 24, height: 24, color: Colors.black),
            label: 'Friend',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/welfareBg.png', width: 24, height: 24),
            activeIcon: Image.network(
                'https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/dovf9udmncfetf2ahdpp.webp',
                width: 24,
                height: 24),
            label: 'My',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
