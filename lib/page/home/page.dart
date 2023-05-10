import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('[debug]build home page');
    return Container(
      color: Colors.greenAccent,
      child: const Center(
        child: Text('home page'),
      ),
    );
  }
}
