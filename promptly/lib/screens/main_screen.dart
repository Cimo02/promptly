import 'package:flutter/material.dart';

import '../bottomAppBar.dart';
import '../borderedButton.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;
  static const String route = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.teal[50],
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 25.0,
                ),
                color: Colors.teal[300],
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Hero(
            tag: 'title',
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.teal[300],
                fontFamily: 'Winkle',
                fontSize: 28,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.teal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ],
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
      ),
    );
  }
}
