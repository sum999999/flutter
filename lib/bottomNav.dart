import 'package:flutter/material.dart';
import './page/find.dart';
import './page/friend.dart';
import './page/home.dart';
import './page/my.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  static const List<Widget> _pages = <Widget>[
    Home(),
    Find(),
    Friend(),
    My(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => _pages[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _pages.asMap().map((index, page) {
          return MapEntry(index, _buildOffstageNavigator(index));
        }).values.toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems.map((item) {
          return BottomNavigationBarItem(
            icon: item['icon'].startsWith('http')
                ? Image.network(item['icon'], width: 24, height: 24)
                : SvgPicture.asset(item['icon'], width: 24, height: 24),
          activeIcon: item['activeIcon'].startsWith('http')
                ? Image.network(item['activeIcon'], width: 24, height: 24, color: Colors.black)
                : Image.asset(item['activeIcon'], width: 24, height: 24, color: Colors.black),
            label: item['label'],
          );
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }

  final List<Map<String, dynamic>> _navItems = [
    {
      'label': 'Home',
      'icon': 'images/vip.svg',
      'activeIcon': 'images/welfareBg.png',
    },
    {
      'label': 'Find',
      'icon': 'images/welfareBg.png',
      'activeIcon': 'images/welfareBg.png',
    },
    {
      'label': 'Friend',
      'icon': 'https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/dovf9udmncfetf2ahdpp.webp',
      'activeIcon': 'images/welfareBg.png',
    },
    {
      'label': 'My',
      'icon': 'images/welfareBg.png',
      'activeIcon': 'https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/dovf9udmncfetf2ahdpp.webp',
    },
  ];
}
