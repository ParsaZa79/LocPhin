import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  static final String _routeName = '/videos-screen';

  static String get route {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Videos",
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 25,
                fontFamily: "Errorist"),
          ),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
        ),
        body: Center(
          child: Text('Hi'),
        ));
  }
}
