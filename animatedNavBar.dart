import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavigationBarDemo extends StatefulWidget {
  @override
  _NavigationBarDemoState createState() => _NavigationBarDemoState();
}

class _NavigationBarDemoState extends State<NavigationBarDemo>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  var _selectedIndex = 0;
  AnimationController _hide;

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _hide.value = 1;
  }

  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      bottomNavigationBar: SizeTransition(
        sizeFactor: _hide,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.amber),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text('Add'),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                backgroundColor: Colors.green),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.depth == 0) {
                if (notification is UserScrollNotification) {
                  final UserScrollNotification userScroll = notification;
                  switch (userScroll.direction) {
                    case ScrollDirection.forward:
                      _hide.forward();
                      break;
                    case ScrollDirection.reverse:
                      _hide.reverse();
                      break;
                    case ScrollDirection.idle:
                      break;
                  }
                }
              }
              return false;
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              //color: Colors.red,
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
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
