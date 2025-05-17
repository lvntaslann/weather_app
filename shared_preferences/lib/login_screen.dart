// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storage_operations_sp/home_page.dart';
import 'package:storage_operations_sp/storage_devices.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //oluşturduğumuz Storage sınıfımızın nesnesini oluşturuyoruz Storage storage = Storage(); olarakta alınabilirdi
  final storage = Storage();
  //giriş sayfasında girdi almak için textfield controllerlarımızı oluşturuyoruz
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();

  @override
  void initState() {
    //burada uygulama her açıldığında kullanıcı eğer uygulama da varsa direkt ana sayfaya yönlendirilmesi için var
    // uygulama her çalıştığında Storage sınıfımızdaki checkUserInformationsFromDevice fonskiyonu çalışıyor
    /*
  void checkUserInformationsFromDevice(BuildContext context) async {

    final sharePreferences = await SharedPreferences.getInstance();
    final String? email = sharePreferences.getString("email");
    final String? password = sharePreferences.getString("password");
    if (email != null && password != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  */
    super.initState();
    storage.checkUserInformationsFromDevice(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "email@gmail.com",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelAlignment: FloatingLabelAlignment.center),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _passWordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    icon: Icon(Icons.key),
                    labelText: "Password",
                    hintText: "for eg. !0wlğrlpw*1ewşlr",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    floatingLabelAlignment: FloatingLabelAlignment.center),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  // butona basma işlemi gerçekleştirildiğinde buradaki key ve valuemiz olan email,password ve controllerları oluşturduğumuz fonksiyon ile kaydediliyor
                  onPressed: () {
                    storage.saveUserToDevice("email", _emailController.text);
                    storage.saveUserToDevice(
                        "password", _passWordController.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
