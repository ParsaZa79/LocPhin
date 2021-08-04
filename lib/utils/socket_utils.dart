import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gson/gson.dart';

class SocketUtil {
  static const String SERVER_IP = "192.168.43.141";
  static const int SERVER_PORT = 8585;
  static double? xLang, yLang;
  static bool? isDeviceCodeCorrect;

  static void listenToSocket(deviceCode) async {
    try {
      Socket.connect(SERVER_IP, SERVER_PORT).then((socket) {
        print('Connected to: '
            '${socket.remoteAddress.address}:${socket.remotePort}');
        sendMessage(message: 'p', socket: socket);
        var msg = gson.encode({
          'device_code': '$deviceCode',
        }, beautify: true);
        print('JSON file:\n$msg');
        sendMessage(message: msg, socket: socket);
        print('JSON file sent...');
        socket.listen((data) {
          print('Data received...');
          var receivedMessage = utf8.decode(data);
          var braceIndex = receivedMessage.indexOf('{');
          var res = receivedMessage.substring(braceIndex);
          print('Received JSON file:\n$res');
          Map<String, dynamic> json = jsonDecode(res);
          xLang = json['x_lang'];
          yLang = json['y_lang'];
          isDeviceCodeCorrect = (xLang == 0.0 && yLang == 0.0) ? false : true;
          print(isDeviceCodeCorrect! ? 'Correct format!' : 'Incorrect format!');
          print('Closing the socket...');
          socket.close();
        });
      });
    } catch (err) {
      print("Couldn't connect to the socket!");
    }
  }

  static void sendMessage(
      {@required String? message, @required Socket? socket}) {
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
