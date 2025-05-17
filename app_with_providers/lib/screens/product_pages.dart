import 'package:app_with_provider/const.dart';
import 'package:app_with_provider/providers/cart_providers.dart';
import 'package:app_with_provider/screens/product_informations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPages extends StatelessWidget {
  const ProductPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    title: const Text("Products"),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        icon: const Icon(Icons.shopping_cart),
      )
    ],
  );
}

Widget _buildUI(BuildContext context) {
  CartProvider cartProvider = Provider.of<CartProvider>(context);
  return ListView.builder(
    itemCount: PRODUCTS.length,
    itemBuilder: (context, index) {
      Product product = PRODUCTS[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductInformations(product: product),
            ),
          );
        },
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFF40E0D0),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(
                        color: Color(0xFF40E0D0),
                      ),
                    ),
                    trailing: Checkbox(
                      value: cartProvider.items.contains(product),
                      onChanged: (value) {
                        if (value == true) {
                          cartProvider.add(product);
                        } else {
                          cartProvider.remove(product);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
