import 'package:flutter/material.dart';
import 'package:flutter_starter/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_starter/page/home/page.dart';
import 'package:flutter_starter/page/user/page.dart';
import 'package:flutter_starter/page/wallet/page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      extendBody: true,
      body: PageView(
        controller: _controller,
        onPageChanged: _handlePageChanged,
        children: const [
          HomePage(),
          WalletPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
