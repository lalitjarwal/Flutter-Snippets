import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _childBody = HomeWidget();
  static var title = 'Home';
  var action=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)
      ,actions: action,),
      body: _childBody,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                setState(() {
                  title = 'Home';
                  _childBody = HomeWidget();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                setState(() {
                  title = 'item1';
                  _childBody = Item1();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                setState(() {
                  action=[PopupMenuButton(itemBuilder:(context){})];
                  title = 'item2';
                  _childBody = Item2();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(child: Text('My Home Page!')),
      color: Colors.red,
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(child: Text('My Item1 Page!')),
      color: Colors.green,
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(child: Text('My Item 2 Page!')),
      color: Colors.blue,
    );
  }
}
