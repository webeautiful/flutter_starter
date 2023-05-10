import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    print('[debug]build wallet page');
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: const Center(
          child: Text('wallet page'),
        ),
      ),
    );
  }
}
