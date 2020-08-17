import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final _controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var pageValue = 0;
  @override
  Widget build(BuildContext context) {
    var infinity = MediaQuery.of(context).size.height;
    var infinity2 = MediaQuery.of(context).size.width;
    var textStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);
    return Scaffold(
      // appBar: AppBar(title: Text('Page View Demo')),
      floatingActionButton: FloatingActionButton.extended(
          icon: pageValue < 4 ? Icon(Icons.arrow_forward) : Icon(Icons.done),
          label: pageValue < 4 ? Text('Next') : Text('Done'),
          onPressed: () {
            if (pageValue < 4) _controller.jumpToPage(++pageValue);
            print(pageValue);
          }),
      body: PageView(
        //scrollDirection: Axis.vertical,
        //allowImplicitScrolling: true,
        //pageSnapping: false,
        onPageChanged: (value) {
          setState(() {
            pageValue = value;
          });
          //
          print('Page Changed $value');
        },
        controller: _controller,
        //physics: NeverScrollableScrollPhysics(),
        //dragStartBehavior: DragStartBehavior.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            height: infinity,
            width: infinity2,
            color: Colors.red,
            child: Center(child: Text('Screen 1', style: textStyle)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            height: infinity,
            width: infinity2,
            color: Colors.green,
            child: Center(child: Text('Screen 2', style: textStyle)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            height: infinity,
            width: infinity2,
            color: Colors.blue,
            child: Center(child: Text('Screen 3', style: textStyle)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            height: infinity,
            width: infinity2,
            color: Colors.yellow,
            child: Center(child: Text('Screen 4', style: textStyle)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            height: infinity,
            width: infinity2,
            color: Colors.indigo,
            child: Center(child: Text('Final Screen', style: textStyle)),
          )
        ],
      ),
    );
  }
}
