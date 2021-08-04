import 'package:autism/models/child_location.dart';
import 'package:autism/utils/map_utils.dart';
import 'package:autism/utils/socket_utils.dart';
import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 150,
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
    SocketUtil.listenToSocket("0");
    double x = SocketUtil.xLang!, y = SocketUtil.yLang!;
    return ChildLocation(x: x, y: y);
  }

  static void goToMap() {
    getCoords().then((var location) => MapUtils.openMap(location));
  }
}
