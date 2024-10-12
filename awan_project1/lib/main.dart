import 'package:awan_project1/Responsive/layout.dart';
import 'package:flutter/material.dart';

import 'screens/mobile_screen.dart';
import 'screens/web_screen.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const ResponsiveLayout(
        mobileBody: Mobile(),
        webBody: WebBody(),
      ),
    );
  }
}