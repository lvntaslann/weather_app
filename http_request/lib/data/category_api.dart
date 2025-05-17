import 'package:http/http.dart' as http;

class CategoryApi {
  //category bilgisini almak için localde çalıştırdığımız json dosyasına request atıyoruz
  static Future getCategories() async {
    var url = Uri.parse("http://10.0.2.2:3000/categories");
    return http.get(url);
  }
}
