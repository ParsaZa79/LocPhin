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
          "ویدیوها",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "IranSans",
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}
