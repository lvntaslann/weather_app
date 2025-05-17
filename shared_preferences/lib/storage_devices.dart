import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:storage_operations_sp/home_page.dart';

class Storage {
  void saveUserToDevice(String key, String value) async {
    //sharepreferences Instance edilerek başlatıldı
    //set işlemi ve yanında type ile veri ekleyebiliyorz
    //sp sadece int string bool double ve list değerler alabilir
    final sharePreferences = await SharedPreferences.getInstance();
    sharePreferences.setString(key, value);
  }

  void checkUserInformationsFromDevice(BuildContext context) async {
    //yine instance edilerek başlatıldı
    //get komuduyla kaydedilmiş veriler kontrol edilebilir
    //get komudu çağırıldığında bir key ister o da bizim tabloda verdiğimiz isimdir örneğin String email email@gmail.com  email key  email@gmail.com valuedir
    final sharePreferences = await SharedPreferences.getInstance();
    final String? email = sharePreferences.getString("email");
    final String? password = sharePreferences.getString("password");

    //kontrol edilerek navigator işlemi gerçekleştirilir
    if (email != null && password != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
