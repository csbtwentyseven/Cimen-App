import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Veritabani {
  String? kullaniciadi;
  Veritabani(this.kullaniciadi);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> kullaniciKaydet() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '${this.kullaniciadi}');
    print(prefs.getString('username'));
  }

  void cimenIste() async {
    final prefs = await SharedPreferences.getInstance();
    String isteyenKisi = prefs.getString('username')!;
    Map<String, dynamic> cimen_durum = Map();
    cimen_durum['cimen_durum'] = true;
    cimen_durum['cimen_durum_mesaj'] = '$isteyenKisi çimen istedi';
    cimen_durum['tarih'] = FieldValue.serverTimestamp();
    cimen_durum['bildirim'] = true;

    Map<String, dynamic> cimen_durum_bildirim = Map();
    cimen_durum_bildirim['bildirim'] = true;

    firestore
        .collection("cimendurum")
        .doc("bildirim")
        .set(cimen_durum_bildirim);
    firestore.collection("cimendurum").doc("cimendurum").set(cimen_durum);
    firestore
        .collection("cimendurum")
        .doc("bildirim")
        .set(cimen_durum_bildirim);
  }

  void cimenSifirla() async {
    final prefs = await SharedPreferences.getInstance();
    String isteyenKisi = prefs.getString('username')!;
    Map<String, dynamic> cimen_durum_bildirim = Map();
    cimen_durum_bildirim['bildirim'] = false;
    cimen_durum_bildirim['cimen_durum_mesaj'] = "Kimse Çimen İstemedi Sadıç...";

    firestore
        .collection("cimendurum")
        .doc("bildirim")
        .set(cimen_durum_bildirim);

    firestore
        .collection("cimendurum")
        .doc("cimendurum")
        .set(cimen_durum_bildirim);
  }

  Future<String> cimenIstendiMi() async {
    DocumentSnapshot cimen_current =
        await firestore.collection("cimendurum").doc("cimendurum").get();

    Map<String, dynamic>? cimenData =
        cimen_current.data() as Map<String, dynamic>?;

    var sonCimenData = cimenData?["cimen_durum"];
    var cimenMesaj = cimenData?["cimen_durum_mesaj"];

    print(cimenMesaj);

    return cimenMesaj;
  }
}
