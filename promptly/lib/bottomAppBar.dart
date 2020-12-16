import 'package:flutter/material.dart';

class BottomControlBar extends StatelessWidget {
  const BottomControlBar({
    this.fabLocation,
  });

  final FloatingActionButtonLocation fabLocation;

  static final centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

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
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                size: 30.0,
              ),
              onPressed: () {
                print('Favorite button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
