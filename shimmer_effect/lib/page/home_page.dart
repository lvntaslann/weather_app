import 'package:flutter/material.dart';
import '../model/food.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGet = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isGet = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodItems = Food.getFood();
    return Scaffold(
      appBar: _myAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Special Foods",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return isGet ? _foodWidget(foodItems, index) : _shimmerEffect();
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _myAppbar() {
    return AppBar(
      title: Center(
          child: Text(
        "FOOD",
        style: TextStyle(
            color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
      )),
      backgroundColor: Colors.orange.shade300,
    );
  }

  Padding _foodWidget(List<Food> foodItems, int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 250, 185, 101),
              const Color.fromARGB(255, 245, 133, 41)
            ])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _foodImage(foodItems, index),
                  SizedBox(width: 20),
                  _foodName(foodItems, index),
                  SizedBox(
                    width: 25,
                  ),
                  _foodPrice(foodItems, index)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _foodPrice(List<Food> foodItems, int index) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        foodItems[index].price,
        style: TextStyle(
            color: Colors.white70, fontSize: 35, fontWeight: FontWeight.w700),
      ),
    );
  }

  Align _foodName(List<Food> foodItems, int index) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            foodItems[index].name,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            foodItems[index].description,
            style: TextStyle(
                color: const Color.fromARGB(255, 225, 225, 225),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Container _foodImage(List<Food> foodItems, int index) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
            image: AssetImage(foodItems[index].image), fit: BoxFit.cover),
      ),
    );
  }

  Widget _shimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 250, 185, 101),
              const Color.fromARGB(255, 245, 133, 41)
            ])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imageShimmer(),
                  SizedBox(width: 35),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        _textShimmer(),
                        SizedBox(
                          height: 10,
                        ),
                        _textShimmer()
                      ],
                    ),
                  ),
                  SizedBox(width: 50),
                  _priceShimmer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _priceShimmer() {
    return SizedBox(
      width: 50.0,
      height: 10.0,
      child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 241, 148, 27),
          highlightColor: const Color.fromARGB(255, 242, 197, 159),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(40)),
          )),
    );
  }

  SizedBox _textShimmer() {
    return SizedBox(
      width: 100.0,
      height: 10.0,
      child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 241, 148, 27),
          highlightColor: const Color.fromARGB(255, 242, 197, 159),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(40)),
          )),
    );
  }

  SizedBox _imageShimmer() {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 241, 148, 27),
          highlightColor: const Color.fromARGB(255, 242, 197, 159),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
          )),
    );
  }
}
