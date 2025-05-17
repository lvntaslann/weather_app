import 'package:flutter/material.dart';

class Mapilenotsorgulama extends StatefulWidget {
  const Mapilenotsorgulama({Key? key}) : super(key: key);

  @override
  _MapilenotsorgulamaState createState() => _MapilenotsorgulamaState();
}

class _MapilenotsorgulamaState extends State<Mapilenotsorgulama> {
  var ogrencivenot = {"ahmet": "50", "mehmet": "30", "ali": "86"};
  String sonuc = "";

  String nothesapla() {
    setState(() {
      sonuc = "";
      //ogrenci ve not kısmında ogrenci key not ise valueyi belirtiyor
      ogrencivenot.forEach((ogrenci, not) {
        int puan = int.parse(not);
        if (puan <= 30) {
          sonuc += "$ogrenci kaldı: $puan\n";
        } else {
          sonuc += "$ogrenci geçti: $puan\n";
        }
      });
    });
    //sonuc değerini döndürüyor
    // örnek: ahmet geçti:50 gibi
    return sonuc;
  }

  void dialogGonder(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav sonucu"),
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
            child: ListView.builder(
              itemCount: ogrencivenot.length,
              itemBuilder: (BuildContext context, int index) {
                //mapteki keyleri elementAt ile sırasıyla aktarıyoruz
                //itemCount sayesinde ogrencivenot mapi kadar dönüyor
                String ogrenci = ogrencivenot.keys.elementAt(index);
                String not = ogrencivenot[ogrenci]!;
                return ListTile(
                  title: Text("$ogrenci: $not"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
            child: ElevatedButton(
              onPressed: () {
                //not hesapla fonksiyonundan döndürülen sonuc değeri mesaj değişkenine atanıyor
                var mesaj = nothesapla();
                //dilaog gonder fonksiyonuna mesaj iletiliyor ve dialog olarak çıktı veriliyor
                dialogGonder(context, mesaj);
              },
              child: Text("Not hesapla"),
            ),
          ),
        ],
      ),
    );
  }
}
