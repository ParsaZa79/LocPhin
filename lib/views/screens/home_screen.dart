import 'package:autism/data/categories_repo.dart';
import 'package:autism/views/components/nav_drawer.dart';
import 'package:flutter/material.dart';
import '../components/category_card.dart';

class HomeScreen extends StatelessWidget {
  static final String _routeName = '/home-screen';

  static String get route {
    return _routeName;
  }

  const HomeScreen({Key? key}) : super(key: key);

  void routeToFindScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/find-child-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          "LocPhin",
          style: TextStyle(
              color: Colors.amber, fontSize: 25, fontFamily: 'Errorist'),
        ),
        backgroundColor: Colors.cyan[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: categories
              .map((catData) =>
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CategoryCard(catData.id!, catData.title!, catData.imageURL!),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: Container(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(40, 40, 40, 0.9),
            onPressed: () => routeToFindScreen(context),
            child: Icon(Icons.map),
          ),
        ),
      ),
    );
  }
}
