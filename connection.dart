import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: title,
      home: ConnectionDemo(),
    );
  }
}

class ConnectionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectionBody(),
    );
  }
}

class ConnectionBody extends StatefulWidget {
  @override
  _ConnectionBodyState createState() => _ConnectionBodyState();
}

class _ConnectionBodyState extends State<ConnectionBody> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    String status;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        status = "Your are Offline";
        break;
      case ConnectivityResult.mobile:
        status = "Inernet connection available on Mobile: Online";
        break;
      case ConnectivityResult.wifi:
        status = "Inernet connection available on WiFi: Online";
    }

    return Container(
      child: Center(
          child: Text(
        '$status',
        textScaleFactor: 1.2,
      )),
    );
  }
}

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
