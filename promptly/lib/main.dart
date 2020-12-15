import 'package:flutter/material.dart';

import 'bottomAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal[200],
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
          icon: const Icon(Icons.menu),
          color: Colors.teal[200],
          onPressed: () {
            print('Menu button pressed');
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.teal[200],
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
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
                  color: Colors.teal[400],
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomControlBar(
        fabLocation: FloatingActionButtonLocation.centerFloat,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _newPrompt,
        tooltip: 'New prompt',
        backgroundColor: Colors.teal[200],
      ),
    );
  }
}
