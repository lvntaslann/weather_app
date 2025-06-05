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

    timer = Timer.periodic(Duration(seconds: 60), (_) {
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
      backgroundColor: const Color.fromARGB(255, 16, 15, 24),
      body: Consumer<CryptoViewmodel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              const SizedBox(height: 70),
              _currentBalance(viewModel),
              const SizedBox(height: 30),
              _userFunction(),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Row _userFunction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _userFunctionItem(
          "Receive",
          Icon(Icons.download, color: Colors.white, size: 35),
        ),
        _userFunctionItem(
          "Topup",
          Icon(Icons.money, color: Colors.white, size: 30),
        ),
        _userFunctionItem(
          "Withdraw",
          Icon(Icons.upload, color: Colors.white, size: 35),
        )
      ],
    );
  }

  Column _userFunctionItem(String title, Icon icon) {
    return Column(
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 42, 42, 43),
              borderRadius: BorderRadius.circular(20),
            ),
            child: icon),
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container _currentBalance(CryptoViewmodel viewModel) {
    return Container(
      width: 375,
      height: 225,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Current Balance",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                SizedBox(width: 120),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 61, 67, 70)),
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Colors.yellowAccent,
                    size: 35,
                  ),
                )
              ],
            ),
            Text(
              "\$${viewModel.cryptos[0].price}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Percent Change 24H",
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            Row(
              children: [
                Text(
                  "\$${viewModel.cryptos[0].percentChange24h}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 170),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: viewModel.cryptos[0].percentChange7d > 0
                          ? Colors.green
                          : Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "(${viewModel.cryptos[0].percentChange7d})",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        viewModel.cryptos[0].percentChange7d > 0
                            ? Icons.trending_up
                            : Icons.trending_down,
                        color: Colors.white,
                        weight: 5,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, Crypto crypto) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 500,
            height: 305,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      crypto.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10),
                    Text(crypto.symbol,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Text("7 Day Change: \$${crypto.percentChange7d}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                Text("1 Hour Change: \$${crypto.percentChange1h}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                Text("24 Hour Change: \$${crypto.percentChange24h}",
                    style: const TextStyle(
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
