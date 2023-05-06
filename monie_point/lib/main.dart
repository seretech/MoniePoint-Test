import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monie_point/dashboard.dart';

import 'homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}