import 'package:flutter/material.dart';
import './cell.dart';
import '../routes/router.dart';

class Find extends StatefulWidget {
  const Find({super.key});

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Find'),
        ),
        body: ListView(
          children: [
            Cell(
              title: '我的',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                Navigator.pushNamed(context, '/my');
              },
            ),
            Cell(
              title: '收藏',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                router.navigateTo(context, "/friend");
              },
            ),
            Cell(
              title: 'http',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                router.navigateTo(context, "/httpPage");
              },
            ),
            Cell(
              title: '卡包',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                print('点击了卡包');
              },
            ),
            Cell(
              title: '表情',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                print('点击了表情');
              },
            ),
            Cell(
              title: '设置',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                print('点击了设置');
              },
            ),
          ],
        ));
  }
}
