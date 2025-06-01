class Product {
  final String name;
  final double price;
  final String imageUrl;
  
  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  static List<Product> getProducts() {
    return [
      Product(
        name: "Laptop",
        price: 1500.00,
        imageUrl: "https://picsum.photos/200?random=1",
      ),
      Product(
        name: "Smartphone",
        price: 800.00,
        imageUrl: "https://picsum.photos/200?random=2",
      ),
      Product(
        name: "Headphones",
        price: 200.00,
        imageUrl: "https://picsum.photos/200?random=3",
      ),
    ];
  }
}