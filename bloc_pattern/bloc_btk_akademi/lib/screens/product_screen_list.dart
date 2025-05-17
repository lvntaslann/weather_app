import 'package:bloc_pattern/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductScreenList extends StatelessWidget {
  const ProductScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/cart"),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ProductWidget(),
    );
  }
}
