import 'package:araba_fiyat_tahimini/car_price_predict.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF40E0D0),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Lottie.network(
              "https://lottie.host/e85476e0-e926-421f-8252-d42191696217/13RER9fNTz.json",
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              frameBuilder: (context, child, composition) {
                return Container(
                  child: child,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                    color: Color(0xFF40E0D0),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Find yours car ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 67, 67, 67),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lets Start",
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarPricePredictionForm()));
            },
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Color(0xFF40E0D0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
