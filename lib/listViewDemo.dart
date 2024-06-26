import 'package:flutter/material.dart';
import './model/car.dart';

class Listviewdemo extends StatelessWidget {
  const Listviewdemo({super.key});
//_ 下划线只有文件内部可以访问
  Widget _itemForRow(BuildContext context, int index) {
// final name = data[index].name ?? 'hello';
// final imageUrl = data[index].imageUrl ?? 'https://example.com/default_image.jpg';
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(data[index].imageUrl!),
            const SizedBox(
              height: 50,
            ),
            Text(
              data[index].name!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.amber,
                fontWeight: FontWeight.w700, // 使用更合适的字体权重值
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemForRow,
      itemCount: data.length,
    );
  }
}
