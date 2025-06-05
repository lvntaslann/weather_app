import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final double percentChange;
  const CryptoCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    Color shadowColor;
    IconData iconData;

    if (percentChange > 0) {
      iconColor = const Color.fromARGB(255, 90, 193, 93);
      shadowColor = const Color.fromARGB(167, 80, 200, 86);
      iconData = Icons.arrow_upward;
    } else if (percentChange < 0) {
      iconColor = Colors.red;
      shadowColor = const Color.fromARGB(146, 213, 0, 0);
      iconData = Icons.arrow_downward;
    } else {
      iconColor = Colors.grey;
      shadowColor = Colors.grey.shade700;
      iconData = Icons.remove;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        child: Card(
          color: const Color.fromARGB(191, 30, 29, 29),
          shadowColor: shadowColor,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Icon(iconData, color: iconColor),
            ),
            title: Text(
              name,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(symbol,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w200)),
            trailing: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: shadowColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("\$${price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w200)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
