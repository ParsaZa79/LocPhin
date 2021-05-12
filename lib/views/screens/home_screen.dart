import 'package:autism/data/categories_repo.dart';
import 'package:autism/views/components/nav_drawer.dart';
import 'package:flutter/material.dart';
import '../components/category_card.dart';

class HomeScreen extends StatelessWidget {
  static final String _routeName = '/home-screen';

  static String get route {
    return _routeName;
  }

  const HomeScreen({Key key}) : super(key: key);

  void routeToFindScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/find-child-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GridView(
          padding: EdgeInsets.all(25),
          children: categories
              .map((catData) => CategoryCard(
                  catData.id, catData.title, catData.color, catData.imageURL))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 5 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
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
