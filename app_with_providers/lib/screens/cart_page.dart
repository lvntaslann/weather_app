import 'package:app_with_provider/const.dart';
import 'package:app_with_provider/providers/cart_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }
}

PreferredSizeWidget _appBar() {
  return AppBar(
    title: const Text("Cart"),
  );
}

Widget _buildUI() {
  return Consumer<CartProvider>(builder: (context, shoppinglist, _) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: ListView.builder(
            itemCount: shoppinglist.items.length,
            itemBuilder: (context, index) {
              Product product = shoppinglist.items[index];
              return Row(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(product.name),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _confirmedRemoveDialog(context, shoppinglist, product);
                    },
                    icon: Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  )
                ],
              );
            },
          ),
        ),
        Text(
          "Cart Total: \ ${shoppinglist.getCarttotal()}",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  });
}

void _confirmedRemoveDialog(
    BuildContext context, CartProvider shoppinglist, Product product) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to remove ${product.name} ?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              shoppinglist.remove(product);
              Navigator.of(context).pop();
            },
            child: Text("Delete"),
          )
        ],
      );
    },
  );
}
