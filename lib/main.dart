import 'package:flutter/material.dart';
import './listViewDemo.dart';
import './textDemo.dart';
import './statemanger.dart';
import './bottomNav.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        splashColor: Colors.transparent, // 移除水波纹效果
        highlightColor: Colors.transparent, // 移除点击高亮效果
      ),
      home:  const BottomNav(),
    );
  }
}
