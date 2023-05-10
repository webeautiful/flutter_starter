import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<UserPage>  {
  @override
  Widget build(BuildContext context) {
    print('[debug]build user page');
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
