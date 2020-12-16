import 'package:flutter/material.dart';

import 'bottomAppBar.dart';
import 'borderedButton.dart';

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
      home: MyHomePage(title: 'promptly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String prompt = 'drawing prompt';

  void _newPrompt() {
    setState(() {
      // load a new prompt here
      prompt = 'new prompt loaded';
      print('new prompt loaded');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(
            Icons.menu,
            size: 25.0,
          ),
          color: Colors.teal[300],
          onPressed: () {
            print('Menu button pressed');
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.teal[300],
            fontFamily: 'Winkle',
            fontSize: 28,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              prompt,
              style: TextStyle(
                color: Colors.teal[300],
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: BottomControlBar(
          fabLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BorderedButton(_newPrompt),
    );
  }
}
