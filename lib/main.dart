import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './listViewDemo.dart';
import './textDemo.dart';
import './statemanger.dart';
import './bottomNav.dart';
import './page/find.dart';
import './page/friend.dart';
import './page/home.dart';
import './page/my.dart';
import './routes/router.dart';
import './provider/auth_provider.dart';
import './provider/user_info_provider.dart';
import './provider/game_provider.dart';

void main() {
  defineRoutes();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      //如果用原生跳转就需要在这里定义
      routes: {
        '/my': (context) => const My(),
      },
      onGenerateRoute: (settings) {
        //控制原生路由跳转的从下往上上滑动效果
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Find(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // 无动画
          },
        );
      },
      // onGenerateRoute: router.generator, // 设置路由生成器
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        splashColor: Colors.transparent, // 移除水波纹效果
        highlightColor: Colors.transparent, // 移除点击高亮效果
      ),
      home: const BottomNav(),
    );
  }
}
