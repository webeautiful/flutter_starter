import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        child: const Center(
          child: Text('user page'),
        ),
      ),
    );
  }
}
