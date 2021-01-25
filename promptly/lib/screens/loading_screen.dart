import 'package:flutter/material.dart';
import 'package:promptly/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const String route = 'loading';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    int animationCount = 0;

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    animation.addStatusListener((status) {
      animationCount++;
      print(animationCount);

      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        if (animationCount >= 6) {
          Navigator.pushNamed(context, MainScreen.route);
        }
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
          child: Hero(
        tag: 'title',
        child: Text(
          'promptly',
          style: TextStyle(
            color: Colors.white.withOpacity(controller.value),
            fontFamily: 'Winkle',
            fontSize: 36,
          ),
        ),
      )),
    );
  }
}
