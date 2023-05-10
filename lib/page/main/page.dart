import 'package:flutter/material.dart';
import 'package:flutter_starter/page/home/page.dart';
import 'package:flutter_starter/page/user/page.dart';
import 'package:flutter_starter/page/wallet/page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final _controller = PageController(initialPage: 0);

  void _handlePageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: _handlePageChanged,
        children: const [
          HomePage(),
          WalletPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: _defaultColor,), activeIcon: Icon(Icons.home, color: _activeColor,), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet, color: _defaultColor), activeIcon: Icon(Icons.wallet, color: _activeColor), label: '钱包'),
          BottomNavigationBarItem(icon: Icon(Icons.manage_accounts, color: _defaultColor,), activeIcon: Icon(Icons.manage_accounts, color: _activeColor), label: '我的'),
        ],
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        } ,
      ),
    );
  }
}
