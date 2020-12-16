import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final Function onPressed;

  BorderedButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType
            .transparency, //Makes it usable on any background color, thanks @IanSmith
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal[100], width: 12.0),
            color: Colors.teal[300],
            shape: BoxShape.circle,
          ),
          child: InkWell(
            //This keeps the splash effect within the circle
            borderRadius: BorderRadius.circular(
                1000.0), //Something large to ensure a circle
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.create, // or Icons.add
                size: 40.0,
                color: Colors.teal[50],
              ),
            ),
          ),
        ));
  }
}
