import 'package:flutter/material.dart';
import 'package:monie_point/dashboard.dart';
import 'package:monie_point/settings.dart';
import 'package:monie_point/voucher.dart';
import 'package:monie_point/wallets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  var screens =  [
  const Dashboard(),
  const Voucher(),
  const Wallets(),
  const Settings(),
  ];

  final bottomIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet_giftcard),
      label: 'Voucher',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet),
      label: 'Wallet',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: index,
          children: screens
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        type: BottomNavigationBarType.fixed,
        items: bottomIcons,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: index,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
