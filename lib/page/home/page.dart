import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/log_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logI('[debug]build home page');
    return Container(
      color: Colors.greenAccent,
      child: const Center(
        child: Text('home page'),
      ),
    );
  }
}
