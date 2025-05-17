import 'package:app_with_provider/const.dart';
import 'package:flutter/material.dart';

class ProductInformations extends StatelessWidget {
  final Product product;

  const ProductInformations({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(product),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _appBar(Product product) {
    return AppBar(
      title: Text(product.name),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            product.image,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            "Name: ${product.name}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Price: \$${product.price.toString()}",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
