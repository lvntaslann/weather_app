// product_bloc.dart
import 'dart:async';
import 'package:bloc_pattern/data/product_services.dart';
import 'package:bloc_pattern/models/product.dart';

class ProductBloc {
  final productStreamController = StreamController<List<Product>>.broadcast();

  Stream<List<Product>> get getStream => productStreamController.stream;

  List<Product> getAll() {
    return ProductServices.getAll();
  }

  void dispose() {
    productStreamController.close();
  }
}

final productBloc = ProductBloc();
