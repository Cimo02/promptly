import 'package:flutter/material.dart';
import 'package:promptly/screens/loading_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'promptly',
      theme: ThemeData(
        primaryColor: Colors.teal[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoadingScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(title: 'promptly'),
        LoadingScreen.route: (context) => LoadingScreen(),
      },
    );
  }
}
