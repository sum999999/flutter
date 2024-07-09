import 'package:flutter/material.dart';
import './listViewDemo.dart';
import './textDemo.dart';
import './statemanger.dart';
import './bottomNav.dart';
import './page/find.dart';
import './page/friend.dart';
import './page/home.dart';
import './page/my.dart';
import './routes/router.dart';
void main() {
  defineRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      routes: {
        '/my':(context) =>const My(),
      },
       onGenerateRoute: router.generator, // 设置路由生成器
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
