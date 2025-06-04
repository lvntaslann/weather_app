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
      iconColor = Colors.green;
      shadowColor = Colors.yellowAccent.shade700;
      iconData = Icons.arrow_upward;
    } else if (percentChange < 0) {
      iconColor = Colors.red;
      shadowColor = Colors.redAccent.shade700;
      iconData = Icons.arrow_downward;
    } else {
      iconColor = Colors.grey;
      shadowColor = Colors.grey.shade700;
      iconData = Icons.remove;
    }
    return Card(
      color: const Color.fromARGB(255, 53, 53, 53),
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Icon(iconData, color: iconColor),
        ),
        title: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(symbol,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        trailing: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              color: shadowColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text("\$${price}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
