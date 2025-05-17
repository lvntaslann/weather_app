import 'package:bloc_pattern/models/cart.dart';

class CartServices {
  static List<Cart> cartItems = [];
  static CartServices _singLeton = CartServices._internal();

  factory CartServices() {
    return _singLeton;
  }
  CartServices._internal();

  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
