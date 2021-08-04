import 'package:autism/data/repo/categories_repo.dart';
import 'package:autism/views/components/category_card.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static final String _routeName = '/news-screen';

  static String get route {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اخبار",
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
      body: SingleChildScrollView(
        child: Column(
          children: categories
              .map(
                (catData) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CategoryCard(
                    catData.id!,
                    catData.title!,
                    catData.imageURL!,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
