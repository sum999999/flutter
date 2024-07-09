import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const Cell({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              'images/welfareBg.png',
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
           const  Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}