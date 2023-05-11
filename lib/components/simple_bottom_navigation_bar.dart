import 'package:flutter/material.dart';
import 'package:flutter_starter/theme/root_colors.dart';

class SimpleBottomNavigationBar extends StatelessWidget {
  const SimpleBottomNavigationBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  final ValueChanged<int>? onTap;

  final int currentIndex;

  final _defaultColor = Colors.white;
  final _activeColor = RootColors.primary;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            label: '首页'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: _defaultColor),
            activeIcon: Icon(Icons.account_balance_wallet, color: _activeColor),
            label: '钱包'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _defaultColor,
            ),
            activeIcon: Icon(Icons.person, color: _activeColor),
            label: '我的'),
      ],
      onTap: onTap,
    );
  }
}
