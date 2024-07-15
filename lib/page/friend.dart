import 'package:flutter/material.dart';
import '../listViewDemo.dart';
class Friend extends StatefulWidget {
  const Friend({super.key});

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('friend'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/find');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/welfareBg.png'),
            ),
          ),
        ),
        body:const Listviewdemo()
    );
  }
}
