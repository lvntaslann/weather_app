import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictService {
  static Future<String?> predictCarPrice({
    required String yil,
    required String sanziman,
    required String kilometre,
    required String vergi,
    required String mpg,
    required String motorHacmi,
  }) async {
    final response = await http.post(
      Uri.parse('http://10.55.196.158:5000/'),
      body: {
        "Yıl": yil,
        "Şanzıman": sanziman,
        "Kilometre": kilometre,
        "Vergi": vergi,
        "Mil Başına Galon": mpg,
        "Motor Hacmi": motorHacmi,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final price = data['tahmin'];
      return price.toString();
    } else {
      return null;
    }
  }
}
