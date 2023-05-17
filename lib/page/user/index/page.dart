import 'package:flutter/material.dart';
import 'package:flutter_starter/main.dart';
import 'package:flutter_starter/router.dart';
import 'package:flutter_starter/utils/log_util.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    logI('[debug]init user page');
  }

  @override
  void deactivate() {
    super.deactivate();
    logI('deactivate user page');
  }

  @override
  Widget build(BuildContext context) {
    logI('[debug]build user page');
    return Container(
      color: Colors.deepOrange,
      child: SafeArea(
        child: Column(
          children: [
            const Text('user page'),
            ElevatedButton(
              onPressed: () => appRouter.push(RoutePaths.userInfo('10')),
              child: const Text('push /user/10'),
            ),
            ElevatedButton(
              onPressed: () => localeLogic.loadIfChanged(const Locale('en')),
              child: Text($t.languageSwitch),
            )
          ],
        ),
      ),
    );
  }
}
