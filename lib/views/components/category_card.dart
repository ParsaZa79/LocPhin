import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  final String title, imageURL;
  final Color color;
  CategoryCard(this.id, this.title, this.color, this.imageURL);

  void routeToRelatedScreen(BuildContext ctx, {@required int id}) {
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
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: AssetImage(imageURL),
                height: 118,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
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
