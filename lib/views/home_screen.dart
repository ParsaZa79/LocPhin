import 'package:autism/views/components/map_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locphin"),
        backgroundColor: Colors.red[600],
        centerTitle: true,
      ),
      body: MapButton(),
    );
  }
}
