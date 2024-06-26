
import 'package:flutter/material.dart';
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,

      alignment: const Alignment(0, 0),
      width: 200,
      height: 200,
      child: const Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection:TextDirection.rtl,
        children: [
          Icon(Icons.ice_skating, size: 30, color: Colors.red),
          Icon(Icons.abc_rounded, size: 30, color: Colors.red),
          Icon(Icons.ac_unit_rounded, size: 30, color: Colors.red),
        ],
      ),
    );
  }
}

class Textdemo extends StatelessWidget {
  const Textdemo({super.key});

  final title = "i am title";
  final name = 'i am name';

  final TextStyle _textStyle = const TextStyle(
      fontWeight: FontWeight.w500, fontSize: 26, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title $name  gagagagweewywygsgsgsdgsdgsgs',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'I am a ',
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 20),
        children: const <TextSpan>[
          TextSpan(
            text: 'rich ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          TextSpan(
            text: 'text ',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green),
          ),
          TextSpan(
            text: 'component!',
            style: TextStyle(fontSize: 22, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
