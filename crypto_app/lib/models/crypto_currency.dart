class Crypto {
  final String name;
  final String symbol;
  final double price;
  final double rank;
  final double marketCapUsd;
  final double volume24;
  final double volume24a;
  final double percentChange7d;
  final double percentChange24h;
  final double percentChange1h;

  Crypto(
      {required this.name,
      required this.symbol,
      required this.price,
      required this.rank,
      required this.marketCapUsd,
      required this.volume24,
      required this.volume24a,
      required this.percentChange7d,
      required this.percentChange1h,
      required this.percentChange24h});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'] ?? 'Unknown',
      symbol: json['symbol'] ?? '---',
      rank: double.tryParse(json['rank'].toString()) ??0.0,
      marketCapUsd: double.tryParse(json["market_cap_usd"].toString())??0.0,
      volume24: double.tryParse(json['volume24'].toString()) ??0.0,
      volume24a: double.tryParse(json['volume24a'].toString()) ??0.0,
      percentChange7d:double.tryParse(json['percent_change_7d'].toString()) ?? 0.0,
      percentChange1h:double.tryParse(json['percent_change_1h'].toString()) ?? 0.0,
      percentChange24h: double.tryParse(json['percent_change_24h'].toString()) ?? 0.0,
      price: double.tryParse(json['price_usd'].toString()) ?? 0.0,
    );
  }
}
