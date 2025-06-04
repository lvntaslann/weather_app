import 'dart:async';
import 'package:crypto_app/models/crypto_currency.dart';
import 'package:crypto_app/viewmodels/crypto_viewmodel.dart';
import 'package:crypto_app/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    final viewModel = Provider.of<CryptoViewmodel>(context, listen: false);
    viewModel.fetchCryptos();

    timer = Timer.periodic(Duration(seconds: 30), (_) {
      viewModel.fetchCryptos();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 30, 38, 59),
      body: Consumer<CryptoViewmodel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: viewModel.cryptos.length,
            itemBuilder: (context, index) {
              final crypto = viewModel.cryptos[index];
              return InkWell(
                onTap: () {
                  _showDialog(context, crypto);
                },
                child: CryptoCard(
                  name: crypto.name,
                  symbol: crypto.symbol,
                  price: crypto.price.toStringAsFixed(2),
                  percentChange: crypto.percentChange7d,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, Crypto crypto) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 25, 38, 67),
          child: Container(
            width: 500,
            height: 305,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      crypto.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(crypto.symbol,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Text("\$${crypto.percentChange7d}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                Text("\$${crypto.percentChange1h}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                Text("\$${crypto.percentChange24h}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      },
    );
  }
}
