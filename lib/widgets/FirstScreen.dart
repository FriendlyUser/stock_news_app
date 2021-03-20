
import 'package:flutter/material.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(200),
      child: Center(
        child: Text(
          "Click on FAB to Open Drawer",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}