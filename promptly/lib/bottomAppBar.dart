import 'package:flutter/material.dart';

class BottomControlBar extends StatefulWidget {
  const BottomControlBar({
    this.fabLocation,
  });

  final FloatingActionButtonLocation fabLocation;

  static final centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  _BottomControlBarState createState() => _BottomControlBarState();
}

class _BottomControlBarState extends State<BottomControlBar> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: null,
      color: Colors.transparent,
      elevation: 0.0,
      child: IconTheme(
        data: IconThemeData(color: Colors.teal[200]),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.share_rounded,
                size: 30.0,
              ),
              onPressed: () {
                print('Share button pressed');
              },
            ),
            if (BottomControlBar.centerLocations.contains(widget.fabLocation))
              const Spacer(),
            IconButton(
              icon: Icon(
                (isFavorited)
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 30.0,
              ),
              onPressed: () {
                print('favorite button pressed');
                setState(() {
                  isFavorited = !isFavorited;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
