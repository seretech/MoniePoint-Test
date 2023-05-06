import 'package:flutter/material.dart';

import 'mc.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MC.txtB('Voucher Page', Colors.black, 16)
      ),
    );
  }
}
