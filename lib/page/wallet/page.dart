import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/log_util.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    logI('init wallet page');
  }

  @override
  void deactivate() {
    super.deactivate();
    logI('deactivate wallet page');
  }

  @override
  Widget build(BuildContext context) {
    logI('[debug]build wallet page');
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
