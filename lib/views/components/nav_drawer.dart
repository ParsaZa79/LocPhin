import 'package:autism/views/screens/contact_us_screen.dart';
import 'package:autism/views/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String? lgStatus;
  BuildContext? contextInstance;
  List<Widget>? drawerTiles;

  String get loginStatus {
    return lgStatus!;
  }

  void onDrawerItemPressed(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      contextInstance = context;
      drawerTiles = [
        Visibility(
          visible: true,
          child: ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Vx.green600,
            ),
            title: 'ثبت شماره دستگاه'.text.white.make(),
            onTap: () =>
                {onDrawerItemPressed(contextInstance!, SignUpScreen.route)},
          ),
        ),
        Visibility(
          visible: true,
          child: ListTile(
            leading: Icon(
              Icons.qr_code_2,
              color: Vx.gray500,
            ),
            title: 'فرم اطلاعات فرزند'.text.white.make(),
            onTap: () =>
                {onDrawerItemPressed(contextInstance!, ContactUsScreen.route)},
          ),
        ),
        Visibility(
          visible: true,
          child: ListTile(
            leading: Icon(
              Icons.record_voice_over,
              color: Vx.gray500,
            ),
            title: 'ارتباط با ما'.text.white.make(),
            onTap: () =>
                {onDrawerItemPressed(contextInstance!, ContactUsScreen.route)},
          ),
        ),
      ];
    });
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Vx.blueGray800,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SafeArea(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(children: drawerTiles!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
