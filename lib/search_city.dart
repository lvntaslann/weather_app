import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/resuable_widget.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({Key? key}) : super(key: key);

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  TextEditingController _cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                welcomeAnimation(context),
                SizedBox(height: 70),
                searchWidget(context, _cityNameController),
                ElevatedButton(
                  onPressed: () {
                    String cityName = _cityNameController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(cityName: cityName)),
                    );
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(3),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.2),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
