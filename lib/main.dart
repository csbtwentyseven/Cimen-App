import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: login(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF168039)),
    );
  }
}
