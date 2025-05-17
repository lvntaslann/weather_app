import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_operations_sp/storage_devices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email;
  String? password;
  final storage = Storage();

  // locale kaydedilmiş keyi email ve password olan bilgileri ilk olarak sp yi başlatım daha sonra çağırma işlemi yapıyoruz
  void getUserInfo() async {
    final sharePreferences = await SharedPreferences.getInstance();
    email = sharePreferences.getString("email");
    password = sharePreferences.getString("password");
    setState(() {});
  }

  @override
  void initState() {
    //uygulama ilk açıldığında yukarıda yazdığımız fonksiyon çalışıyor
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // kullanıcı bilgilerini yazdırma işlemi
          Center(child: Text("Email: $email" + "   " + "Password: $password")),
    );
  }
}
