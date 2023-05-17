import 'package:flutter/material.dart';
import 'package:flutter_starter/assets.dart';
import 'package:flutter_starter/main.dart';
import 'package:flutter_starter/utils/log_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logI('[debug]build home page');
    return Container(
      color: Colors.greenAccent,
      child: SafeArea(
        child: Column(
          children: [
            SearchBar(
              hintText: $t.searchPlaceholder,
            ),
            Image.asset(
              ImagePaths.appLogo,
              width: 100,
              height: 100,
            ),
            Text(
              $t.helloWorld('world'),
            ),
          ],
        ),
      ),
    );
  }
}
