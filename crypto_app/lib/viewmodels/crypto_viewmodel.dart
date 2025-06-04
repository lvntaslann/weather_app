import 'package:crypto_app/models/crypto_currency.dart';
import 'package:crypto_app/services/crypto_service.dart';
import 'package:flutter/material.dart';

class CryptoViewmodel with ChangeNotifier{
  final CryptoService _cryptoService = CryptoService();
  List<Crypto> _cryptos = [];
  bool _isLoading = false;

  List<Crypto> get cryptos => _cryptos;
  bool get isLoading => _isLoading;

  Future<void> fetchCryptos() async{
    _isLoading =true;
    notifyListeners();
    _cryptos = await _cryptoService.fetchCryptos();
    _isLoading=false;
    notifyListeners();
  }
}