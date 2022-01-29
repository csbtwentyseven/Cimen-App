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
    var mesajDocRef = cimenColRef.doc('cimendurum');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: mesajDocRef.snapshots(),
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
                  return Text(
                    "${user_data["cimen_durum_mesaj"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.green[800]),
                  );
                }
              },
            ),
            IconButton(
              onPressed: () async {
                Veritabani vt = Veritabani("gerekyok");
                Timer(Duration(seconds: 6), () {
                  vt.cimenSifirla();
                });

                vt.cimenIste();

                String cimenMesaj = await vt.cimenIstendiMi();
                mesajDegistir(cimenMesaj);
              },
              icon: Image.asset('assets/butonimg.png'),
              iconSize: 256,
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

                  return Text("${user_data!["bildirim"]}");
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
    String bildirimMesaj = await vt.cimenIstendiMi();

    NotificationService()
        .showNotification(1, "ÇİMEN İSTEĞİ", "$bildirimMesaj", 4);
  }
}
