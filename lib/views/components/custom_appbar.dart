import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Find Your Child",
        style: TextStyle(
            color: Colors.amberAccent, fontSize: 25, fontFamily: "Errorist"),
      ),
      backgroundColor: Colors.red,
      centerTitle: true,
    );
  }
}
