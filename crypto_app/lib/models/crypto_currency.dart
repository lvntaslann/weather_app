class Crypto {
  final String name;
  final String symbol;
  final double price;
  final double percentChange7d;
  final double percentChange24h;
  final double percentChange1h;

  Crypto(
      {required this.name,
      required this.symbol,
      required this.price,
      required this.percentChange7d,
      required this.percentChange1h,
      required this.percentChange24h});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'] ?? 'Unknown',
      symbol: json['symbol'] ?? '---',
      percentChange7d:double.tryParse(json['percent_change_7d'].toString()) ?? 0.0,
      percentChange1h:double.tryParse(json['percent_change_1h'].toString()) ?? 0.0,
      percentChange24h: double.tryParse(json['percent_change_24h'].toString()) ?? 0.0,
      price: double.tryParse(json['price_usd'].toString()) ?? 0.0,
    );
  }
}
