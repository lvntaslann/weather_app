import 'dart:async';
import 'package:crypto_app/models/crypto_currency.dart';
import 'package:crypto_app/pages/crypto_details_page.dart';
import 'package:crypto_app/viewmodels/crypto_viewmodel.dart';
import 'package:crypto_app/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<CryptoViewmodel>(context, listen: false);
      viewModel.fetchCryptos();
    });

    timer = Timer.periodic(Duration(seconds: 60), (_) {
      final viewModel = Provider.of<CryptoViewmodel>(context, listen: false);
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
                        //_showDialog(context, crypto);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CryptoDetailsPage(crypto: crypto,)));
                      },
                      child: CryptoCard(
                        name: crypto.name,
                        symbol: crypto.symbol,
                        price: crypto.price.toStringAsFixed(2),
                        percentChange: crypto.percentChange24h,
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

  Widget _currentBalance(CryptoViewmodel viewModel) {
    if (viewModel.cryptos.isEmpty) {
      return Container(
        height: 225,
        width: 375,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    // Liste doluysa normal içerik göster
    final crypto = viewModel.cryptos[0];
    return Container(
      width: 375,
      height: 225,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 30, 30, 30),
        borderRadius: BorderRadius.circular(10),
      ),
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
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 120),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 61, 67, 70),
                  ),
                  child: const Icon(
                    Icons.currency_bitcoin,
                    color: Colors.yellowAccent,
                    size: 35,
                  ),
                )
              ],
            ),
            Text(
              "\$${crypto.price}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Percent Change 24H",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                Text(
                  "\$${crypto.percentChange24h}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 170),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:
                        crypto.percentChange24h > 0 ? Colors.green : Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "(${crypto.percentChange24h})",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        crypto.percentChange1h > 0
                            ? Icons.trending_up
                            : Icons.trending_down,
                        color: Colors.white,
                        weight: 5,
                      ),
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
    final List<FlSpot> priceSpots = [
      FlSpot(0, crypto.percentChange1h.toDouble()),
      FlSpot(1, crypto.percentChange24h.toDouble()),
      FlSpot(2, crypto.percentChange7d.toDouble()),
    ];

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 500, // Increased height to accommodate content
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade700),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Crypto name and symbol
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  // Chart
                  SizedBox(
                      height: 200, // Fixed height for chart
                      child: LineChart(LineChartData(
                        minX: 0,
                        maxX: 2,
                        minY: priceSpots
                                .map((e) => e.y)
                                .reduce((a, b) => a < b ? a : b) -
                            2,
                        maxY: priceSpots
                                .map((e) => e.y)
                                .reduce((a, b) => a > b ? a : b) +
                            2,
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text("1h",
                                        style: TextStyle(color: Colors.white));
                                  case 1:
                                    return const Text("24h",
                                        style: TextStyle(color: Colors.white));
                                  case 2:
                                    return const Text("7d",
                                        style: TextStyle(color: Colors.white));
                                  default:
                                    return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: priceSpots,
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.yellowAccent,
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.yellowAccent.withOpacity(0.2),
                            ),
                            dotData: FlDotData(show: true),
                          ),
                        ],
                      ))),
                  // Price changes
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
