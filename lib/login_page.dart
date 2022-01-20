import 'package:flutter/material.dart';
import 'Strings.dart';
import 'inputAlan.dart';
import 'home_page.dart';
import 'veritabani.dart';
import 'package:firebase_core/firebase_core.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  Veritabani veritabani = new Veritabani();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              Metinler.uygulama_adi,
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF168039)),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Image.asset('assets/grass.png')),
          Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 4.0, color: Color(0xFF168039)),
              right: BorderSide(
                width: 4.0,
                color: Color(0xFF45BF55),
              ),
              left: BorderSide(
                width: 4.0,
                color: Color(0xFF45BF55),
              ),
              bottom: BorderSide(
                width: 4.0,
                color: Color(0xFF168039),
              ),
            )),
            child: Column(
              children: [
                input_alan("user"),
                input_alan("sifre"),
                ElevatedButton(
                    onPressed: () {
                      veritabani.kullaniciAdiKontrol();
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
