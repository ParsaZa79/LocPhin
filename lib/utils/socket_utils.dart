import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gson/gson.dart';

class SocketUtil {
  static const String SERVER_IP = "192.168.43.141";
  static const int SERVER_PORT = 8585;
  static double? xLang, yLang;

  static void listenToSocket() async {
    try {
      await Socket.connect('192.168.43.141', 8585).then((socket) {
        print('Connected to: '
            '${socket.remoteAddress.address}:${socket.remotePort}');
        sendMessage(message: 'p', socket: socket);
        var msg = gson.encode({
          'device_code': '0',
        }, beautify: true);
        sendMessage(message: msg, socket: socket);
        socket.listen((data) {
          var receivedMessage = utf8.decode(data);
          var braceIndex = receivedMessage.indexOf('{');
          var res = receivedMessage.substring(braceIndex);
          Map<String, dynamic> json = jsonDecode(res);
          xLang = json['x_lang'];
          yLang = json['y_lang'];
          print(xLang);
          print(yLang);
        });
      });
    } catch (err) {
      print('An unexpected error happened!');
    }
  }

  static void sendMessage({@required String? message, @required Socket? socket}) {
    var length = message!.length;
    var byteList = int32bytes(length).reversed;
    for (var i in byteList) {
      socket!.write(String.fromCharCode(i));
    }
    socket!.write(message);
  }

  static Int8List int32bytes(int value) =>
      Int8List(4)..buffer.asInt32List()[0] = value;
}
