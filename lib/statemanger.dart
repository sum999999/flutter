import 'package:flutter/material.dart';
class Statemanger extends StatefulWidget {
  const Statemanger({super.key});
  @override
  State<Statemanger> createState() => _StatemangerState();
}

class _StatemangerState extends State<Statemanger> {
  int _count = 110;
  void _incrementCount() {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Chip(
          label: Text('Count: $_count'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCount,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
