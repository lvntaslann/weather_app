import 'package:flutter/material.dart';
import 'package:http_request/models/product.dart';
import 'package:http_request/widgets/product_list_row_widget.dart';

class ProductListWidget extends StatefulWidget {
  final List<Product> products;

  const ProductListWidget(this.products);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return builProductList(context);
  }

  Widget builProductList(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          //yan yana 2 ürün olacak şekilde ürünleri göstermek için ProductListRowWidgetine main_screen sayfasından aldığımız product listesinin elemanlarını döndürüyürouz
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }
}
