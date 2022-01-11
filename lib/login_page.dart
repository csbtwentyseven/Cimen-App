import 'package:flutter/material.dart';
import 'Strings.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Metinler.uygulama_adi),
        backgroundColor: Color(0xFF168039),
      ),
      body: Center(
          child: Column(
        children: [Text("Hello World")],
      )),
    );
  }
}
