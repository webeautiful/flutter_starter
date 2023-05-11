import 'package:flutter/material.dart';
import 'package:flutter_starter/theme/root_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  final ValueChanged<int>? onTap;

  final int currentIndex;

  final _defaultColor = Colors.white;
  final _activeColor = RootColors.primary;

  Widget _buildBarItem(int index) {
    List<IconData> iconList = [
      Icons.home,
      Icons.account_balance_wallet,
      Icons.person
    ];
    return Expanded(
        child: InkWell(
      onTap: () {
        onTap?.call(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconList[index],
            size: 22,
            color: currentIndex == index ? _activeColor : _defaultColor,
          ),
          const SizedBox(
            height: 5,
          ),
          if (currentIndex == index)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: _activeColor,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 1,
      child: Center(
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Row(
            children: List<Widget>.generate(3, (index) => _buildBarItem(index)),
          ),
        ),
      ),
    );
  }
}
