import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;
  
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this);

    _curve =CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_curve);
      
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 50
        ),
      ]
    ).animate(_curve);
    _animationController.forward();
    _animationController.addListener(() {
      print(_animationController.value);
    });

    _animationController.addStatusListener((status){
      if(status==AnimationStatus.completed){
        setState(() {
          isFav=true;
        });
      }else if(status==AnimationStatus.dismissed){
        setState(() {
          isFav=false;
        });
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isFav ? _animationController.reverse():_animationController.forward();
          },
        );
      },
    );
  }
}
