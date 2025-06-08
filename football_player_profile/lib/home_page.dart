import 'package:flutter/material.dart';
import 'package:football_player_profile/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(duration: Duration(seconds: 5),vsync: this)..repeat(reverse: true);
  late final Animation<double> animation = Tween<double>(begin: 1,end: 1.2).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final players = Players.players;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: ScaleTransition(
                  scale: animation,
                  child: Image.network(
                    players[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                padding: EdgeInsets.all(20),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),

                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      players[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          height: 1,
                          fontSize: 42,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      players[index].about,
                      style: const TextStyle(
                         color: Colors.grey, height: 1, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                players[index].gamePlay,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                players[index].totalGoal,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                              height: 45,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30)),
                              child:const  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "More Details",
                                      style:  TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
