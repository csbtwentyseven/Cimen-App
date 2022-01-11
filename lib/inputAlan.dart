import 'package:flutter/material.dart';
import 'Strings.dart';

class input_alan extends StatefulWidget {
  late String tur;
  input_alan(this.tur, {Key? key}) : super(key: key);

  @override
  _input_alanState createState() => _input_alanState();
}

class _input_alanState extends State<input_alan> {
  late TextEditingController _kullaniciAdiController;
  late TextEditingController _sifreKontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _kullaniciAdiController = TextEditingController();
    _sifreKontroller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _kullaniciAdiController.dispose();
    _sifreKontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tur == "user") {
      // this.tur bi ust class icin, stateful widget ici data paylasimi yapmak amaciyla widget kullan
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: TextFormField(
          controller: _kullaniciAdiController,
          autofocus: true,
          decoration: InputDecoration(
              labelText: Metinler.kullanici_adi,
              hintText: Metinler.kullanici_adi,
              prefixIcon: Icon(Icons.account_circle),
              suffixIcon: Icon(Icons.lock),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF168039), width: 2.5),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF168039), width: 2.5),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              )),
        ),
      );
    } else if (widget.tur == "sifre") {
      return Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
        child: TextFormField(
          controller: _sifreKontroller,
          obscureText: true,
          decoration: InputDecoration(
              labelText: Metinler.sifre,
              hintText: Metinler.sifre,
              prefixIcon: Icon(Icons.password_sharp),
              suffixIcon: Icon(Icons.lock),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF168039), width: 2.5),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF168039), width: 2.5),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
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
