import 'dart:async';

import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        title: title,
        home:Streams());
  }
}

class Streams extends StatefulWidget {
  static Stream<int> StreamCreater(Duration interval, [int maxCount]) {
    StreamController<int> controller;
    Timer timer;
    int count = 0;

    void increment_count(_) {
      count++;

      if (count == maxCount) {
        timer.cancel();
        controller.sink.close();
      } else if (count == 3) {
        controller.sink.addError('Error !');
      } else if (count < maxCount) {
        controller.sink.add(count);
      }
    }

    void startTimer() {
      timer = Timer.periodic(interval, increment_count);
    }

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
      }
    }

    controller = StreamController<int>(
        onListen: startTimer,
        onPause: stopTimer,
        onResume: startTimer,
        onCancel: stopTimer);

    return controller.stream;
  }

  @override
  _StreamsState createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {
  var style = TextStyle(
    color: Colors.blue,
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.arrow_circle_down),
      ),
      body: StreamBuilder<int>(
        stream: Streams.StreamCreater(const Duration(seconds: 1), 6),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "No data yet",
                style: style,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(
                "Done !",
                style: style,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error,
                style: style,
              ),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: style,
              ),
            );
          }
        },
      ),
    );
  }
}
