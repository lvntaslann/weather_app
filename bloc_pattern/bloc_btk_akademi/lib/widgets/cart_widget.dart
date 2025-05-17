import 'package:bloc_pattern/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cartBloc.getStream,
      initialData: cartBloc.getCart(),
      builder: (context, snapshot) {
        return buildListItems(snapshot);
      },
    );
  }

  buildListItems(AsyncSnapshot snapshot) {
    var cartList = snapshot.data;
    return ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          var cartItem = cartList[index];
          return ListTile(
            title: Text(cartItem.product?.name ?? "Ürün adı yok"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.product?.price.toString() ?? "Ürün fiyatı yok"),
                Text("Adet: ${cartItem.quantity ?? 1}"),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  cartBloc.removeFromCart(cartItem);
                  showAlertDialog(context, cartItem.product?.name);
                },
                icon: Icon(Icons.remove_shopping_cart)),
          );
        });
  }

  void showAlertDialog(BuildContext context, String name) {
    var alert = AlertDialog(
      title: Text(name),
      content: Text("Sepetten çıkartıldı"),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
