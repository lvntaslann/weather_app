import 'package:http/http.dart' as http;

class ProductApi {
  //Product bilgisine nodejs üzerinden local olarak açtığımız json dosyasına erişim sağlamak için request gönderiyoruz iki adet static fonksiyon ile
  static Future getProducts() async {
    var url = Uri.parse("http://10.0.2.2:3000/products");
    return http.get(url);
  }

  static Future getProductsByCategoryId(int categoryId) async {
    var url = Uri.parse("http://10.0.2.2:3000/products?categoryId=$categoryId");
    return http.get(url);
  }
}
