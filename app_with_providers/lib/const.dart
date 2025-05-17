import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.image,
  });
}

final List<Product> PRODUCTS = [
  Product(
    id: 0,
    image: "assets/laptop-removebg-preview.png",
    name: "Laptop",
    color: Colors.red,
    price: 999.99,
  ),
  Product(
    id: 1,
    image: "assets/smartphone-removebg-preview.png", // Değişiklik yapıldı
    name: "Smartphone",
    color: Colors.blue,
    price: 969.99,
  ),
  Product(
    id: 2,
    image: "assets/wirelessearbuds-removebg-preview.png",
    name: "Wireless eardbuds",
    color: Colors.purple,
    price: 999.99,
  ),
  Product(
    id: 3,
    image: "assets/smartwatch-removebg-preview.png",
    name: "Smartwatch",
    color: Colors.yellow,
    price: 199.99,
  ),
  Product(
    id: 4,
    image: "assets/playstation-removebg-preview.png",
    name: "Playstation",
    color: Colors.grey,
    price: 499.99,
  ),
  Product(
    id: 5,
    image: "assets/xbox-removebg-preview.png",
    name: "Xbox",
    color: Colors.greenAccent,
    price: 299.99,
  ),
  Product(
    id: 6,
    image: "assets/ball-removebg-preview.png",
    name: "Ball",
    color: Colors.pink,
    price: 99.99,
  ),
];
