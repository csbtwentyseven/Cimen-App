import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Text(
                "Çimen İstemek İçin Aşağıdaki Butona Bas Sadıç",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF168039)),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/butonimg.png'),
              iconSize: 256,
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                'Henüz Kimse Çimen İstemedi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
