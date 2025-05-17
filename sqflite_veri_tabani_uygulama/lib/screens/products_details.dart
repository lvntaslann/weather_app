import 'package:flutter/material.dart';
import 'package:veri_tabi_calismasi/data/db_helper.dart';
import 'package:veri_tabi_calismasi/models/product_services.dart';

class ProductsDetails extends StatefulWidget {
  //detay bilgisini almak için listeledeğimiz sayfadan Product sınıfı tipinde veriyi almamız lazım
  Product product;
  ProductsDetails({required this.product});

  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

enum Options { delete, update }

class _ProductsDetailsState extends State<ProductsDetails> {
  //DbHelper nesnesi oluşturuldu
  DbHelper dbHelper = DbHelper();
  //kullanıcı controllerları oluşturuldu update işlemi için
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtUnitPrice = TextEditingController();

  @override
  void initState() {
    //detay kısmında güncelleme işlemi de yapılacağı için kullanıcının başlangıçta girdiği değerler initstate ile getirildi
    txtName.text = widget.product.name;
    txtDescription.text = widget.product.description;
    txtUnitPrice.text = widget.product.unitPrice.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün detayı: ${widget.product.name}"),
        actions: [
          // global tanımlanan enum sınıfıyla delete update işlemlerinin gerçekleştirilmesi için popupmenu oluşturuldu
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<Options>(
                child: Text("Sil"),
                value: Options.delete,
              ),
              PopupMenuItem<Options>(
                child: Text("Güncelle"),
                value: Options.update,
              ),
            ],
          ),
        ],
      ),
      body: _buildProductDetail(),
    );
  }

  _buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          _buildTextField("Ürün adı", "${widget.product.name}", txtName),
          _buildTextField("Ürün açıklaması", "${widget.product.description}",
              txtDescription),
          _buildTextField(
              "Ürün fiyatı", "${widget.product.unitPrice}", txtUnitPrice),
        ],
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

  void selectProcess(Options options) async {
    //switch case yöntemleri ile silme ve update kısmı gerçekleştirildi
    switch (options) {
      case Options.delete:
        await dbHelper.delete(widget.product.id!);
        Navigator.pop(context, true);
        break;
      // dbHelper.update(product) ile güncelleme işlemi tam olmayacağı için sanki yeni bir eleman oluşturuyormuş gibi id:widget.product.id ile seçilen ürünün verilerinde güncelleme sağlandı id sabit
      case Options.update:
        await dbHelper.update(Product.withId(
            id: widget.product.id,
            name: txtName.text,
            description: txtDescription.text,
            unitPrice: double.tryParse(txtUnitPrice.text)));
        Navigator.pop(context, true);
        break;
    }
  }
}
