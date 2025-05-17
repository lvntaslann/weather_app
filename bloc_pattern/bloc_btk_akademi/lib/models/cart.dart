import 'package:bloc_pattern/models/product.dart';

class Cart {
  Product product; // sepette ürün bilgilerini görebilmek için
  int quantity;

  Cart(this.product, {this.quantity = 1});
}
