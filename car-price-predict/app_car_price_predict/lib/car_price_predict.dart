import 'package:araba_fiyat_tahimini/predict_services.dart';
import 'package:araba_fiyat_tahimini/result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarPricePredictionForm extends StatefulWidget {
  @override
  _CarPricePredictionFormState createState() => _CarPricePredictionFormState();
}

class _CarPricePredictionFormState extends State<CarPricePredictionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _yilController = TextEditingController();
  final TextEditingController _kilometreController = TextEditingController();
  final TextEditingController _vergiController = TextEditingController();
  final TextEditingController _mpgController = TextEditingController();
  final TextEditingController _motorHacmiController = TextEditingController();

  String? _selectedSanziman;
  Map<String, int> sanzimanlar = {
    "Automatic": 1,
    "Manual": 2,
    "Semi-Auto": 3,
    "Other": 4,
  };

  void _submitForm() async {
    if (_formKey.currentState!.validate() && _selectedSanziman != null) {
      String? price = await PredictService.predictCarPrice(
        yil: _yilController.text,
        sanziman: sanzimanlar[_selectedSanziman].toString(),
        kilometre: _kilometreController.text,
        vergi: _vergiController.text,
        mpg: _mpgController.text,
        motorHacmi: _motorHacmiController.text,
      );
      if (price != null) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Result(
              prediction: price,
              kiloMetre: _kilometreController.text,
              yil: _yilController.text,
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Tahmin başarısız",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Lütfen tüm alanları doldurun ve şanzıman tipini seçin",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40E0D0),
      appBar: _appBarUI(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(100, 50),
                ),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    children: [
                      _textFormFieldUI(_yilController, "Yıl",
                          "Lutfen Yıl değerini giriniz", "For eg. 2015"),
                      _sizedBox(),
                      _sanzimanDropDownButton(),
                      _sizedBox(),
                      _textFormFieldUI(_kilometreController, "Kilometre",
                          "Lütfen Kilometre Değerini giriniz", "For eg. 2000"),
                      _sizedBox(),
                      _textFormFieldUI(_vergiController, "Vergi miktarı",
                          "Lütfen vergi değerini giriniz", "For eg. 300"),
                      _sizedBox(),
                      _textFormFieldUI(
                          _mpgController,
                          "Mil başına galon",
                          "Lütfen Mil başına galon değerini girin",
                          "For eg. 325"),
                      _sizedBox(),
                      _textFormFieldUI(_motorHacmiController, "Motor Hacmi",
                          "Lütfen Motor hacmi değerini giriniz", "For eg. 1.8"),
                      _sizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            _buttonBuildUI(),
          ],
        ),
      ),
    );
  }

  Widget _sizedBox() {
    return SizedBox(
      height: 20,
    );
  }

  Widget _buttonBuildUI() {
    return GestureDetector(
      onTap: () async {
        _submitForm();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(35)),
        child: Center(
            child: Text(
          'Tahmin Et',
          style: TextStyle(color: Color(0xFF40E0D0), fontSize: 25),
        )),
      ),
    );
  }

  DropdownButtonFormField<String> _sanzimanDropDownButton() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Şanzıman',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.cyanAccent, width: 1.0),
        ),
      ),
      value: _selectedSanziman,
      onChanged: (newValue) {
        setState(() {
          _selectedSanziman = newValue;
        });
      },
      items: sanzimanlar.keys.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Lütfen şanzıman tipini seçin';
        }
        return null;
      },
    );
  }

  TextFormField _textFormFieldUI(TextEditingController controller,
      String labelText, String returnText, String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: Colors.cyan,
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.cyan, width: 1.0), // Değişiklik burada
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return returnText;
        }
        return null;
      },
    );
  }

  AppBar _appBarUI() {
    return AppBar(
      backgroundColor: Color(0xFF40E0D0),
      title: Text(
        'Araç Fiyat Tahmini',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: Icon(Icons.car_rental),
        ),
      ],
    );
  }
}
