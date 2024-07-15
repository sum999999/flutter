import 'package:flutter/material.dart';
import './cell.dart';
import '../routes/router.dart';

class Find extends StatefulWidget {
  const Find({super.key});

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> {
  bool showText = true;
  void _onItemTapped() {
    setState(() {
      showText = !showText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Find'),
        ),
        body: ListView(
          children: [
             Center(
                child: Row(
              children: [
                GestureDetector(
                  onTap: _onItemTapped,
                  child:const  Text(
                    '测试显示与隐藏',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
                showText ? const Text('hide') : Container(),
              ],
            )),
            Cell(
              title: '我的页面',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                Navigator.pushNamed(context, '/my');
              },
            ),
            Cell(
              title: '朋友页面',
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
              title: 'home',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                router.navigateTo(context, "/");
              },
            ),
            Cell(
              title: 'drawer',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                router.navigateTo(context, "/drawer");
              },
            ),
            Cell(
              title: 'WelfarePage',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                router.navigateTo(context, "/WelfarePage");
              },
            ),
            Cell(
              title: '手指上拉弹窗',
              imagePath: 'images/welfareBg.png',
              onTap: () {
                router.navigateTo(context, "/SheetPage");
              },
            ),
          ],
        ));
  }
}
