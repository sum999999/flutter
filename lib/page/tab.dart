import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../http/network_service.dart';
import '../provider/auth_provider.dart';
import '../provider/user_info_provider.dart';
import '../provider/game_provider.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final NetworkService _networkService = NetworkService();
  List<TabData> tabs = [];  // 定义一个空的 List<TabData>
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeTabs();
  }

  void _initializeTabs() async {
    for (int i = 0; i < 3; i++) {
      await _performGetRequest(i);
    }
  }

  void _changeTabs(int index) async {
    setState(() {
      _currentIndex = index;
    });
    await _performGetRequest(_currentIndex); // 切换 Tab 时加载相应数据
  }

  Future<void> _performGetRequest(int index) async {
    String endpoint = '/posts/${index + 1}'; // 根据索引确定请求的端点
    final data = await _networkService.getRequest(endpoint);
    setState(() {
      if (tabs.length > index) {
        tabs[index] = TabData(title: data['title'].toString().substring(0, 3), content: data['body']);
      } else {
        tabs.add(TabData(title: data['title'].toString().substring(0, 3), content: data['body']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: tabs.isEmpty
          ? const Center(child: CircularProgressIndicator()) // 数据加载前显示加载指示器
          : Column(
        children: <Widget>[
          TabBar(
            tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              _changeTabs(index);
            },
          ),
          Expanded(
            child: TabBarView(
              children: tabs.asMap().entries.map((entry) {
                int idx = entry.key;
                TabData tab = entry.value;
                return idx == 0 ? const HomeScreen() : TabContent(content: tab.content);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TabData {
  final String title;
  final String content;

  TabData({required this.title, required this.content});
}

class TabContent extends StatelessWidget {
  final String content;
  const TabContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // 添加 padding 参数
        child: Text(
          content,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userInfoProvider = Provider.of<UserInfoProvider>(context);
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('User Name: ${userInfoProvider.name}'),
          Text('User Email: ${userInfoProvider.email}'),
          Text('Is Logged In: ${authProvider.isLoggedIn}'),
          Text('Has Played: ${gameProvider.hasPlayed}'),
          ElevatedButton(
            onPressed: () {
              authProvider.login();
              userInfoProvider.updateUserInfo('John Doe', 'john.doe@example.com');
              gameProvider.playGame();
            },
            child: const Text('Update State'),
          ),
          ElevatedButton(
            onPressed: () {
              authProvider.logout();
              userInfoProvider.updateUserInfo('', '');
              gameProvider.noplayGame();
            },
            child: const Text('remove State'),
          ),
        ],
      ),
    );
  }
}