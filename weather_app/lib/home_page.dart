import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/resuable_widget.dart';

class HomePage extends StatefulWidget {
  final String cityName;

  const HomePage({Key? key, required this.cityName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  bool _showLottieAnimation = true;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      var weather = await _wf.currentWeatherByCityName(widget.cityName);
      setState(() {
        _weather = weather;
        Timer(Duration(seconds: 3), () {
          setState(() {
            _showLottieAnimation = false;
          });
        });
      });
    } catch (e) {
      print("Could not get weather forecast: $e");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: _showLottieAnimation ? buildLottieAnimation(context) : _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return Center(
        child: Container(
          child: Lottie.network(
            "https://lottie.host/6f7182de-bb69-4a56-a66d-7359552c24f6/zQwdp8j8TL.json",
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          locationHeader(context, _weather?.areaName),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          dateTimeInfo(context, _weather?.date),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          weatherIcon(
              context,
              "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png",
              _weather?.weatherDescription),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          currentTemp(context, _weather?.temperature?.celsius),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          extraInfo(context,
              maxTemp: _weather?.tempMax?.celsius,
              minTemp: _weather?.tempMin?.celsius,
              windSpeed: _weather?.windSpeed,
              humidity: _weather?.humidity),
        ],
      ),
    );
  }
}
