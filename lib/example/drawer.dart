import 'package:flutter/material.dart';
class DrawPage extends StatefulWidget {
   const DrawPage({super.key});
    @override
   State createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop(); // Close the drawer
    } else {
      _scaffoldKey.currentState!.openDrawer(); // Open the drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Drawer Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _toggleDrawer,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home tap
              },
            ),
            ListTile(
              leading:const  Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle Settings tap
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleDrawer,
          child: const Text('Toggle Drawer'),
        ),
      ),
    );
  }
}