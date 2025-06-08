import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/crypto_currency.dart';

class CryptoDetailsPage extends StatelessWidget {
  final Crypto crypto;
  const CryptoDetailsPage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<FlSpot> priceSpots = [
      FlSpot(0, crypto.percentChange7d.toDouble()),
      FlSpot(1, crypto.percentChange24h.toDouble()),
      FlSpot(2, crypto.percentChange1h.toDouble()),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 15, 24),
      appBar: AppBar(
        title: Text(crypto.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 16, 15, 24),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // İkon
              _cryptoIcon(screenWidth),
              const SizedBox(height: 16),
              Text("\$${crypto.price}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600)),
              Text(
                '${crypto.name.toUpperCase()}/USD',
                style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    crypto.percentChange24h > 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    color:
                        crypto.percentChange24h > 0 ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text(
                    crypto.percentChange24h.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _sellOrBuyButton(),

              // Line Chart
              _changeLineChart(screenWidth,screenHeight, priceSpots),

              const SizedBox(height: 32),

              _marketCap(),
            ],
          ),
        ),
      ),
    );
  }

  Container _cryptoIcon(double screenWidth) {
    return Container(
      width: screenWidth * 0.25,
      height: screenWidth * 0.25,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 47, 46, 46),
        borderRadius: BorderRadius.circular(screenWidth * 0.125),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.currency_exchange, size: 40, color: Colors.white),
          Text(
            'Rank : ${crypto.rank.toString()}',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  AspectRatio _marketCap() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: crypto.marketCapUsd,
          minY: 0,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: crypto.marketCapUsd,
                  color: Colors.blueAccent,
                  width: 40,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return const Text(
                    "Market Cap",
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  // Değeri Milyon, Milyar formatında göster
                  String formatted = "";
                  if (value >= 1e9) {
                    formatted = "${(value / 1e9).toStringAsFixed(1)}B";
                  } else if (value >= 1e6) {
                    formatted = "${(value / 1e6).toStringAsFixed(1)}M";
                  } else {
                    formatted = value.toStringAsFixed(0);
                  }
                  return Text(
                    formatted,
                    style: const TextStyle(color: Colors.white54, fontSize: 10),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
        ),
      ),
    );
  }

  SizedBox _changeLineChart(double screenWeight,double screenHeight, List<FlSpot> priceSpots) {
    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWeight*0.8,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 2,
          minY: priceSpots.map((e) => e.y).reduce((a, b) => a < b ? a : b) - 2,
          maxY: priceSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 2,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("7d",
                          style: TextStyle(color: Colors.white));
                    case 1:
                      return const Text("24h",
                          style: TextStyle(color: Colors.white));
                    case 2:
                      return const Text("1h",
                          style: TextStyle(color: Colors.white));
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
        ),
      ),
    );
  }

  Row _sellOrBuyButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _myButton("Buy", Colors.green),
        const SizedBox(
          width: 20,
        ),
        _myButton("Sell", Colors.red)
      ],
    );
  }

  Container _myButton(String text, Color color) {
    return Container(
      width: 150,
      height: 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
