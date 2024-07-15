import 'package:flutter/material.dart';
import './detail_page.dart';  // 确保导入 DetailPage

class WelfarePage extends StatelessWidget {
  const WelfarePage({Key? key}) : super(key: key);

  final List<Map<String, String>> banners = const [
    {
      'image': 'images/welfareBg.png',
      'title': 'Win up to 400 Free Spins',
      'description': 'For TPG games top 10 players! Event period: February 1 - February 29, 2024'
    },
    {
      'image': 'images/welfareBg.png',
      'title': '30% Second Deposit Bonus',
      'description': ''
    },
    {
      'image': 'images/welfareBg.png',
      'title': 'Chinese New Year 150% Bonus',
      'description': 'Up to PHP 10000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welfare'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: banners[index]['title']!,
                    description: banners[index]['description']!,
                    image: banners[index]['image']!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 400, // 最大宽度
                    maxHeight: 200, // 最大高度
                  ),
                  child: Image.asset(
                    banners[index]['image']!,
                    fit: BoxFit.cover,
                    width: screenWidth * 0.9, // 图片宽度占屏幕宽度的90%
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}