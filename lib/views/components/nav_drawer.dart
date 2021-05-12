import 'package:autism/views/screens/contact_us_screen.dart';
import 'package:autism/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String lgStatus;
  BuildContext contextInstance;
  List<Widget> drawerTiles;

  String get loginStatus {
    return lgStatus;
  }

  void onDrawerItemPressed(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }

  void initState() {
    super.initState();
    drawerTiles = [
      ListTile(
        leading: Icon(Icons.verified_user),
        title: Text('پروفایل'),
        onTap: () =>
            {onDrawerItemPressed(contextInstance, ProfileScreen.route)},
      ),
      ListTile(
        leading: Icon(Icons.border_color),
        title: Text('ارتباط با ما'),
        onTap: () => {onDrawerItemPressed(context, ContactUsScreen.route)},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      contextInstance = context;
      drawerTiles = [
        ListTile(
          leading: Icon(Icons.verified_user),
          title: Text('پروفایل'),
          onTap: () =>
              {onDrawerItemPressed(contextInstance, ProfileScreen.route)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('ارتباط با ما'),
          onTap: () =>
              {onDrawerItemPressed(contextInstance, ContactUsScreen.route)},
        ),
      ];
    });
    return Container(
      width: MediaQuery.of(context).size.width / 1.9,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(children: drawerTiles),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
