import 'package:bloc_pattern/blocs/cart_bloc.dart';
import 'package:bloc_pattern/blocs/product_bloc.dart';
import 'package:bloc_pattern/models/cart.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, snapshot) {
        return buildProductListItems(snapshot);
      },
    );
  }

  buildProductListItems(
    AsyncSnapshot snapshot,
  ) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        var list = snapshot.data;

        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
            onPressed: () {
              cartBloc.addToCart(Cart(list[index], quantity: 1));
              showAlertDialog(context, list[index].name);
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context, String name) {
    AlertDialog alert = AlertDialog(
      title: Text(name),
      content: Text("Sepete eklendi"),
    );

    showDialog(
      //AlertDialog'u göstermemize yarayan fonksiyon
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
