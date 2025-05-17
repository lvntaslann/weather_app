import 'package:flutter/material.dart';
import 'package:http_request/models/product.dart';

// ignore: must_be_immutable
class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      //her eleman için Inkweell ile tıklanabilir özelliği getiriyoruz ileride description bilgisini verebilmek için
      child: Card(
        //card widgeti içerisinde her elemanın resim(internetten alındı rastgele resim) name bilgisi ve price bilgisi yazdırılıyor
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 25,
              child: Column(
                children: [
                  Image.network(
                    "https://media.istockphoto.com/id/1625128179/tr/foto%C4%9Fraf/composition-of-well-balanced-food-for-healthy-eating.jpg?s=612x612&w=0&k=20&c=IUxcsn64X9QnubLjOKfkpU72a1dBjhPaSqTBqrLD4lY=",
                    fit: BoxFit.contain,
                  ),
                  Text(
                    product.productName,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    product.unitPrice.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
