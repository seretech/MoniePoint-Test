import 'package:flutter/material.dart';

import 'mc.dart';

class Wallets extends StatefulWidget {
  const Wallets({Key? key}) : super(key: key);

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MC.txtB('Wallet Page', Colors.black, 16)
      ),
    );
  }
}
