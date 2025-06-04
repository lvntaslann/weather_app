import 'dart:convert';

import 'package:crypto_app/models/crypto_currency.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  final String api_url = "https://api.coinlore.net/api/tickers/";
  Future<List<Crypto>> fetchCryptos() async {
    final response = await http.get(Uri.parse(api_url));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      print(jsonDecode(response.body));
      return data.map((item) => Crypto.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load cryptos");
    }
  }
}
