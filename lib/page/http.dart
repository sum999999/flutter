import 'package:flutter/material.dart';
import '../http/network_service.dart';


class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  final NetworkService _networkService = NetworkService();
  String _getData = '';
  String _postData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final data = await _networkService.getRequest('/posts/1');
                setState(() {
                  _getData = data.toString();
                });
              },
              child: const Text('GET Request'),
            ),
            Text('GET Response: $_getData'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final data = await _networkService.postRequest('/posts', {
                  'title': 'foo',
                  'body': 'bar',
                  'userId': 1,
                });
                setState(() {
                  _postData = data.toString();
                });
              },
              child: const Text('POST Request'),
            ),
            Text('POST Response: $_postData'),
          ],
        ),
      ),
    );
  }
}