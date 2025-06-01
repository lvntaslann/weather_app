import 'package:flutter/material.dart';
import 'package:flutter_example/model/cart.dart';
import 'package:flutter_example/model/product.dart';

class ProductPage extends StatefulWidget {
  
  const ProductPage({ Key? key, }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = Product.getProducts();

  ShoppingCart cart = ShoppingCart();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.network(product.imageUrl, height: 200, width: 300, fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            product.name,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            cart.addProduct(product);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${product.name} sepete eklendi!"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                         icon: Icon(Icons.add_shopping_cart),)
                      ],
                    ),
                  ),
                );
              }),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Sepet"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: cart.items.map((item) {
                      return ListTile(
                        title: Text(item.product.name),
                        subtitle: Text("Adet: ${item.quantity}"),
                        trailing: Text("\$${(item.product.price * item.quantity).toStringAsFixed(2)}"),
                      );
                    }).toList(),
                  ),
                  actions: [
                    Text("Toplam Fiyat: \$${cart.totalPrice.toStringAsFixed(2)}"),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Kapat"),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Sepeti Görüntüle"),
          ),
        ],
      ),
    );
  }
}