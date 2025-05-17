import 'dart:convert';
import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:http_request/data/category_api.dart';
import 'package:http_request/data/product_api.dart';
import 'package:http_request/models/category.dart';
import 'package:http_request/models/product.dart';
import 'package:http_request/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //ekranımızda göstermek için category(Category sınıfından) isimlerini ve bunu göstereceğimiz widgeti ve ürünleri(Product sınıfından) bir liste içine aldık
  List<Category> categories = [];
  List<Widget> categoriesWidget = [];
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getCategoriesFromApi();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //yatay eksende kaydırılabilir şekilde category isimlerini sıralandırabilmek için widgetimizi oluşturduk
                children: categoriesWidget,
              ),
            ),
            //ürünlerin listelenmesi için category id ye göre listeye atadığımız listeyi bu widgete göndererek gösterimini sağladık
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    //CategoryApi sınıfına kategorileri getirmesi için istekte bulunduk ve daha sonra getCategoryWidgets fonksiyonuyla setState içerisinde ekranın güncellenmesini sağladık
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  void getCategoryWidgets() {
    //categoriesWidget listesine tüm elemanları ekledik
    //burada ekleme işlemi yaparken getCategoryWidgetten yararlandık
    categoriesWidget.clear();
    for (int index = 0; index < categories.length; index++) {
      categoriesWidget.add(getCategoryWidget(categories[index]));
    }
  }

  Widget getCategoryWidget(Category category) {
    //kategorilerin getirildilten sonra bir TextButton içerisinde listeenmesini sağladık
    //butonlara basla işlemi gerçekleştirildiğinde getProductByCategoryId fonksiyonu çalıştırıldı
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
      onPressed: () {
        getProductByCategoryId(category);
      },
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }

  void getProductByCategoryId(Category category) {
    //içeirisinde Category nesensinden Id bilgisini alıyor
    //ProductApi sınıfından ıdye göre product verilerinin gelmesini sağlıyor daha sonrasında da her bir elemanı liste şeklinde gösteriyor
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProduct() {
    //id gerekmeksizin uygulama açıldığı zama initState içerisinde çalıştırıalarak product bilgilerinin gelmesini sağladık
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
