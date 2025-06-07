import 'dart:math';

import 'package:flutter/material.dart';

class HiddenAnimationPage extends StatefulWidget {
  const HiddenAnimationPage({Key? key}) : super(key: key);

  @override
  _HiddenAnimationPageState createState() => _HiddenAnimationPageState();
}

class _HiddenAnimationPageState extends State<HiddenAnimationPage>
    with TickerProviderStateMixin {
  final double cardSize = 150;
  late final holeSizeTween = Tween<double>(begin: 0, end: 1.5 * cardSize);
  late final holeAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));

  double get holeSize => holeSizeTween.evaluate(holeAnimationController);

  late final cardOffsetAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  late final cardOffsetTween = Tween<double>(begin: 0, end: cardSize * 2)
      .chain(CurveTween(curve: Curves.easeInBack));
  late final cardRotationTween = Tween<double>(begin: 0, end: 0.5)
      .chain(CurveTween(curve: Curves.easeInBack));
  late final cardElevationTween = Tween<double>(begin: 2, end: 20)
      .chain(CurveTween(curve: Curves.easeInBack));

  double get cardOffset =>
      cardOffsetTween.evaluate(cardOffsetAnimationController);
  double get cardRotation =>
      cardRotationTween.evaluate(cardOffsetAnimationController);
  double get cardElevation =>
      cardElevationTween.evaluate(cardOffsetAnimationController);
  @override
  void initState() {
    super.initState();
    holeAnimationController.addListener(() => setState(
          () {},
        ));

    cardOffsetAnimationController.addListener(() => setState(
          () {},
        ));
  }

  @override
  void dispose() {
    super.dispose();
    cardOffsetAnimationController.dispose();
    holeAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await holeAnimationController.forward();
              await cardOffsetAnimationController.forward();
              Future.delayed(Duration(milliseconds: 200),
                  () => holeAnimationController.reverse());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              cardOffsetAnimationController.reverse();
              holeAnimationController.reverse();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: cardSize * 1.25,
          child: ClipPath(
            clipper: BlackHoleClipper(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: holeSize,
                  child: Image.asset(
                    "assets/hole.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, cardOffset),
                      child: Transform.rotate(
                          angle: cardRotation,
                          child: HelloCard(
                            size: cardSize,
                            elevation: cardElevation,
                          )),
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

class BlackHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      0,
      pi,
      true,
    );
    path.lineTo(0, -1000);
    path.lineTo(size.width, -1000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BlackHoleClipper oldClipper) => false;
}

class HelloCard extends StatelessWidget {
  const HelloCard({Key? key, required this.size, required this.elevation})
      : super(key: key);
  final double size, elevation;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox.square(
        dimension: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purpleAccent),
          child: Center(
            child: const Text(
              "Levent\nAslan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
