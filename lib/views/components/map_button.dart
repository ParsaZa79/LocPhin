import 'package:autism/models/ChildLocation.dart';
import 'package:autism/utils/MapUtils.dart';
import 'package:autism/utils/SocketUtil.dart';
import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => {goToMap()},
                tooltip: 'Find',
                child: Icon(Icons.map),
              ),
            ),
          ),
        )
      ],
    );
  }

  static Future<ChildLocation> getCoords() async {
    SocketUtil.listenToSocket();
    double x = SocketUtil.xLang, y = SocketUtil.yLang;
    return ChildLocation(x: x, y: y);
  }

  static void goToMap() {
    getCoords().then((var location) => MapUtils.openMap(location));
  }
}
