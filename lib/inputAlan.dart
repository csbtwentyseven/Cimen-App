import 'package:flutter/material.dart';
import 'Strings.dart';
import 'veritabani.dart';
import 'home_page.dart';
import 'NotificationApi.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class InputAlan extends StatefulWidget {
  late String tur;

  InputAlan(this.tur, {Key? key}) : super(key: key);

  @override
  _InputAlanState createState() => _InputAlanState();
}

class _InputAlanState extends State<InputAlan> {
  late TextEditingController _kullaniciAdiController;
  late TextEditingController _sifreKontroller;

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
    _kullaniciAdiController = TextEditingController();
    _sifreKontroller = TextEditingController();
  }

  @override
  void dispose() {
    _kullaniciAdiController.dispose();
    _sifreKontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String kullaniciAdi = _kullaniciAdiController.text;
    if (widget.tur == "user") {
      // this.tur bi ust class icin, stateful widget ici data paylasimi yapmak amaciyla widget kullan
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: _kullaniciAdiController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: Metinler.kullanici_adi,
                  hintText: Metinler.kullanici_adi,
                  prefixIcon: Icon(Icons.account_circle),
                  suffixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF168039), width: 2.5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF168039), width: 2.5),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                  onPressed: () {
                    Veritabani vt = Veritabani(_kullaniciAdiController.text);
                    vt.kullaniciKaydet();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  NotificationService().showNotification(
                      1, "ÇİMEN İSTEĞİ", "SAİD ÇİMEN İSTEDİ", 4);
                },
                child: Text("Bildirim Göster"))
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: TextFormField(
          decoration: const InputDecoration(
              labelText: "E - Mail",
              hintText: "E-Mail",
              prefixIcon: Icon(Icons.email_outlined),
              suffixIcon: Icon(Icons.lock),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45BF55), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
        ),
      );
    }
  }
}
