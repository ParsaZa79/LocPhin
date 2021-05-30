import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  final String title, imageURL;
  CategoryCard(this.id, this.title, this.imageURL);

  void routeToRelatedScreen(BuildContext ctx, {@required int? id}) {
    var route;
    switch (id) {
      case 1:
        route = '/facilities-screen';
        break;
      case 2:
        route = '/videos-screen';
        break;
      case 3:
        route = '/news-screen';
        break;
    }
    Navigator.of(ctx).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image(
              image: AssetImage(imageURL),
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => routeToRelatedScreen(context, id: id),
                child: Text('اطلاعات بیشتر'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
