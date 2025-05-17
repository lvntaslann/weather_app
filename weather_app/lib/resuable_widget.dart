import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

//city name
Widget locationHeader(BuildContext context, String? areaName) {
  return Column(
    children: [
      Text(
        areaName ?? "",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

//datetime
Widget dateTimeInfo(BuildContext context, DateTime? dateTime) {
  if (dateTime == null) return SizedBox(); // Null case handled gracefully
  return Column(
    children: [
      Text(
        DateFormat("h:mm a").format(dateTime),
        style: TextStyle(
          color: Colors.white,
          fontSize: 35,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat("EEEE").format(dateTime),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Text(
              "${DateFormat("d.M.y").format(dateTime)}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      )
    ],
  );
}

//weathericon
Widget weatherIcon(
    BuildContext context, String? weatherIconUrl, String? weatherDescription) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(weatherIconUrl ?? ""),
          ),
        ),
      ),
      Text(
        weatherDescription ?? "",
        style:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
      )
    ],
  );
}

//temperature of the weather
Widget currentTemp(BuildContext context, double? temperature) {
  return Text(
    "${temperature?.toStringAsFixed(0)}° C",
    style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 90,
        fontWeight: FontWeight.w500),
  );
}

//extras of weather
Widget extraInfo(BuildContext context,
    {double? maxTemp, double? minTemp, double? windSpeed, double? humidity}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    width: MediaQuery.of(context).size.width * 0.80,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 67, 67, 67),
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Max: ${maxTemp?.toStringAsFixed(0)}°C ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Min: ${minTemp?.toStringAsFixed(0)}°C ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Wind: ${windSpeed?.toStringAsFixed(0)}m/s ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Humidity: ${humidity?.toStringAsFixed(0)}% ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    ),
  );
}

//searching animation
Widget buildLottieAnimation(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    body: Center(
      child: Container(
        child: Lottie.network(
          "https://lottie.host/c5de0d27-f8a4-4fdb-a3bb-eeb8d749aefd/WvQu924P3Y.json",
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    ),
  );
}

//welcome animation
Widget welcomeAnimation(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Lottie.network(
        "https://lottie.host/c1189a2d-cea0-450e-a054-432c070ceeb8/ZNSCe98h54.json",
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
      ),
      Text(
        "Welcome my weather app",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

//search widget
Widget searchWidget(BuildContext context, TextEditingController controller) {
  return Column(
    children: [
      Lottie.network(
        "https://lottie.host/6f7182de-bb69-4a56-a66d-7359552c24f6/zQwdp8j8TL.json",
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.4,
      ),
      SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextField(
          controller: controller,
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 0, 0, 0),
            hintText: "Search weather for your city",
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
            ),
            floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
