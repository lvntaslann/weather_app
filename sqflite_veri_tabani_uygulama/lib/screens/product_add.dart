import 'package:flutter/material.dart';
import 'package:veri_tabi_calismasi/data/db_helper.dart';
import 'package:veri_tabi_calismasi/models/product_services.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  //DbHelper sınıfının nesnesi oluşturuldu
  DbHelper dbHelper = DbHelper();
  //kullanıcıdan yeni ürün bilgileri için textfieldların controllerları oluşturuldu
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtUnitPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            _buildTextField("Ürün adı", "Karpuz", txtName),
            _buildTextField("Ürün açıklaması", "Açıklama", txtDescription),
            _buildTextField("Ürün fiyatı", "fiyat", txtUnitPrice),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String labelTxt, String hintTxt, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(labelText: labelTxt, hintText: hintTxt),
      controller: controller,
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
        onPressed: () async {
          addProduct();
        },
        child: Text("Ekle"));
  }

  void addProduct() async {
    //dbHelperin ekleme fonksiyonu çağrıldı ve Product sınıfı ile buradaki controller değerleri tabloya eklendi
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.tryParse(txtUnitPrice.text)));

    Navigator.pop(context, true);
  }
}
