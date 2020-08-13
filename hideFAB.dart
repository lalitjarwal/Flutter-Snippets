import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Hide fab Demo';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: title,
      home: HideFab(),
    );
  }
}

class HideFab extends StatefulWidget {
  @override
  _HideFabState createState() => _HideFabState();
}

class _HideFabState extends State<HideFab> {
  final _scrollController = ScrollController();
  var showFab = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hide FAB Demo')),
      floatingActionButton: showFab
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
          : null,
      body: Container(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (userScroll) {
            switch (userScroll.direction) {
              case ScrollDirection.forward:
                setState(() {
                  showFab = true;
                });
                break;
              case ScrollDirection.reverse:
                setState(() {
                  showFab = false;
                });
                break;
              case ScrollDirection.idle:
                break;
            }
          },
          child: ListView(
            controller: _scrollController,
            children: [
              for (var i = 0; i < 20; i++)
                Container(
                    height: 100,
                    width: double.infinity,
                    color: Color.fromRGBO(
                        100 * i + 10, 50 * i + 20, 30 * i + 30, 0.5))
            ],
          ),
        ),
      ),
    );
  }
}
