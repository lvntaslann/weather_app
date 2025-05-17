// cart_bloc.dart
import 'dart:async';
import 'package:bloc_pattern/data/cart_services.dart';
import 'package:bloc_pattern/models/cart.dart';

class CartBloc {
  final cartStreamController = StreamController<List<Cart>>.broadcast();

  Stream<List<Cart>> get getStream => cartStreamController.stream;

  void addToCart(Cart item) {
    CartServices.addToCart(item);

    cartStreamController.sink.add(CartServices.getCart());
  }

  void removeFromCart(Cart item) {
    CartServices.removeFromCart(item);
    cartStreamController.sink.add(CartServices.getCart());
  }

  List<Cart> getCart() {
    return CartServices.getCart();
  }

  void dispose() {
    cartStreamController.close();
  }
}

final cartBloc = CartBloc();
