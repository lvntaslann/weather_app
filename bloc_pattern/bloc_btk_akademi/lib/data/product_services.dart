import 'package:bloc_pattern/models/product.dart';

class ProductServices {
  static List<Product> products = [];
  // private bir constructordur
  ProductServices._internal();
  //atama işlemi yaparak private bir constructora erişim kazanıyoruz
  static ProductServices _singLeton = ProductServices._internal();

//factory ile fabrika yapıcı olarak bir consturctor oluştururak bu constructoru döndürüyoruz
  factory ProductServices() {
    return _singLeton;
  }

  static List<Product> getAll() {
    products.add(Product(id: 1, name: "Acer", price: 6000));
    products.add(Product(id: 2, name: "Dell", price: 7000));
    products.add(Product(id: 3, name: "Mac", price: 10000));
    products.add(Product(id: 4, name: "Monster", price: 5000));
    products.add(Product(id: 5, name: "HP", price: 6500));
    return products;
  }
}
