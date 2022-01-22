import 'package:flutter/material.dart';
import 'veritabani.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cimenMesaj = "none";
  void mesajDegistir(String mesaj) {
    setState(() {
      cimenMesaj = mesaj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: Text(
                "Çimen İstemek İçin Aşağıdaki Butona Bas Sadıç",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF168039)),
              ),
            ),
            IconButton(
              onPressed: () async {
                Veritabani vt = Veritabani("gerekyok");
                vt.cimenIste();

                String cimenMesaj = await vt.cimenIstendiMi();
                mesajDegistir(cimenMesaj);
              },
              icon: Image.asset('assets/butonimg.png'),
              iconSize: 256,
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                '$cimenMesaj',
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
