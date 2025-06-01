import 'package:flutter_example/model/product.dart';

class CartItem{
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class ShoppingCart{
  final List<CartItem> items = [];

  void addProduct(Product product){
    final index = items.indexWhere((item)=>item.product.name==product.name);
    if(index>=0){
      items[index].quantity+=1;
    }else{
      items.add(CartItem(product: product));
    }
  }

  double get totalPrice {
    return items.fold(0.0, (total, item) => total + (item.product.price * item.quantity));
  }
}