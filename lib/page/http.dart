import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../http/network_service.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  final NetworkService _networkService = NetworkService();
  String _getData = '';
  String _postData = '';

  @override
  void initState() {
    super.initState();
    _networkService.addListener(_updateLoading);
  }

  @override
  void dispose() {
    _networkService.removeListener(_updateLoading);
    _networkService.dispose();
    super.dispose();
  }

  void _updateLoading() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _networkService,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dio Example'),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: _performGetRequest,
                    child: const Text('GET Request'),
                  ),
                  Text('GET Response: $_getData'),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _performPostRequest,
                    child: const Text('POST Request'),
                  ),
                  Text('POST Response: $_postData'),
                ],
              ),
            ),
            if (_networkService.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  // 方法用于处理 GET 请求
  void _performGetRequest() async {
    final data = await _networkService.getRequest('/posts/1');
    setState(() {
      _getData = data.toString();
    });
  }

  // 方法用于处理 POST 请求
  void _performPostRequest() async {
    final data = await _networkService.postRequest('/posts', {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });
    setState(() {
      _postData = data.toString();
    });
  }
}