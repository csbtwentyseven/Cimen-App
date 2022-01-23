import 'dart:async';
import 'package:cimen/NotificationApi.dart';
import 'package:flutter/material.dart';
import 'veritabani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Veritabani vt = Veritabani("gerekyok");

  @override
  void initState() {
    super.initState();
  }

  String cimenMesaj = "none";
  void mesajDegistir(String mesaj) {
    setState(() {
      cimenMesaj = mesaj;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference cimenColRef = vt.firestore.collection('cimendurum');
    var cimenDocRef = cimenColRef.doc('bildirim');

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
                Timer(Duration(seconds: 3), () {
                  vt.cimenSifirla();
                });

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
            ),
            StreamBuilder<DocumentSnapshot>(
              stream: cimenDocRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('ERROR');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  Map<String, dynamic>? user_data =
                      snapshot.data!.data() as Map<String, dynamic>?;
                  if (user_data!["bildirim"]) {
                    bildirimGonder();
                  }
                  return Text("${user_data["bildirim"]}");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> bildirimGonder() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    final prefs = await SharedPreferences.getInstance();

    NotificationService().showNotification(
        1, "ÇİMEN İSTEĞİ", "${prefs.getString('username')} ÇİMEN İSTEDİ", 4);
  }
}
