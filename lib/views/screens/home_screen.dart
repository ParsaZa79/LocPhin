import 'package:autism/data/repo/categories_repo.dart';
import 'package:autism/utils/ui_utils.dart';
import 'package:autism/views/components/category_card.dart';
import 'package:autism/views/components/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  static final String _routeName = '/home-screen';

  static String get route {
    return _routeName;
  }

  const HomeScreen({Key? key}) : super(key: key);

  void routeToFindScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/find-child-screen');
  }

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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: NavDrawer(),
        appBar: AppBar(
          title: "Phinism"
              .text
              .headline4(context)
              .extraBold
              .white
              .fontFamily(
                GoogleFonts.inconsolata().fontFamily!,
              )
              .make()
              .shimmer(
                primaryColor: Vx.black,
                secondaryColor: Vx.white,
              ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          toolbarHeight: 70,
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
        floatingActionButton: Container(
          width: 75,
          height: 75,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Vx.teal600,
              onPressed: () => routeToFindScreen(context),
              child: Icon(Icons.map),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);
  }
}
