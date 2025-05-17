import 'package:flutter/material.dart';
import 'package:veri_tabi_calismasi/data/db_helper.dart';
import 'package:veri_tabi_calismasi/models/product_services.dart';
import 'package:veri_tabi_calismasi/screens/product_add.dart';
import 'package:veri_tabi_calismasi/screens/products_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  //DbHelper sınıfının nesnesi oluşturuldu var dbHelper=DbHelper();  DbHelper dbHelper = new DbHelper() var dbHelper=new DbHelper(); gibi kullanımlarda olabilir fakat flutter new işlemini zorunlu tutmaz
  DbHelper dbHelper = DbHelper();
  //Product sınıfı tipinde bir liste oluşturduk içerisini eklediğimiz verilerle güncelleyeceğiz
  late List<Product> products;
  int productCounter = 0;

  @override
  void initState() {
    //uygulama ilk çalıştığında ürünleri listelemek için statfulwidgetin super.initState ile initState fonksiyonuna ulaşıldı
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün listesi"),
      ),
      body: _buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: goToProductAdd,
        child: Icon(Icons.add),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView _buildProductList() {
    return ListView.builder(
        itemCount: productCounter,
        itemBuilder: (BuildContext context, index) {
          return Card(
            color: Colors.cyan,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Text("P"),
                backgroundColor: Colors.black,
              ),
              title: Text(this.products[index].name),
              subtitle: Text(this.products[index].description),
              onTap: () {
                //detay sayfasına listede seçilen indexe göre gönderilme işlemi sağlandı
                goToDetail(this.products[index]);
              },
            ),
          );
        });
  }

  void goToProductAdd() async {
    dynamic result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductAdd()),
    );
    if (result != null && result is bool) {
      if (result) {
        getProducts();
      }
    }
  }

  void getProducts() async {
    //dbHelperin getProducts fonskiyonu çalıştırılarak setState yöntemi ile arayüz güncellendi(setState yöntemi olmazsa değişim olsa bile göremezdik)
    var productsFuture = await dbHelper.getProducts();
    setState(() {
      if (productsFuture != null) {
        this.products = productsFuture;
        productCounter = productsFuture.length;
      }
    });
  }

  void goToDetail(Product product) async {
    //detay kısmında güncelleme işlemi varsa setState işle arayüz yenilendi
    dynamic result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductsDetails(
          product: product,
        ),
      ),
    );
    setState(() {
      if (result != null && result is bool && result) {
        getProducts();
      }
    });
  }
}
