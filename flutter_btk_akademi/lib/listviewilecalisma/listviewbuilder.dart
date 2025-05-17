import 'package:flutter/material.dart';

class NotGoruntuleme extends StatefulWidget {
  @override
  _NotGoruntulemeState createState() => _NotGoruntulemeState();
}

class _NotGoruntulemeState extends State<NotGoruntuleme> {
  var ogrenciler = ["ahmet", "mehmet", "mustafa"];
  var notlar = [50, 60, 70];
  String sonuc = "";

  String notHesapla() {
    setState(() {
      sonuc = "";
      for (int i = 0; i < notlar.length; i++) {
        if (notlar[i] <= 49) {
          sonuc += "ogrenci ${i} Kaldı: " + notlar[i].toString() + "\n";
        } else {
          sonuc += "ogrenci ${i} geçti\n";
        }
      }
    });
    return sonuc;
  }

  void dialogGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav notu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Görüntüleme"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ogrenciler.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          ogrenciler[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: notlar.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          notlar[index].toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                var mesaj = notHesapla();
                dialogGoster(context, mesaj);
              },
              child: Text("Sonucu gör"),
            ),
          ),
        ],
      ),
    );
  }
}
