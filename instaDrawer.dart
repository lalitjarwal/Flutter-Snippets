import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

//Package used flutter_inner_drawer: ^0.5.7+2

class InstaDrawer extends StatefulWidget {
  @override
  _InstaDrawerState createState() => _InstaDrawerState();
}

class _InstaDrawerState extends State<InstaDrawer> {
  final key = GlobalKey<InnerDrawerState>();
  var _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
        key: key,
        colorTransitionChild: Colors.transparent,
        onTapClose: true,
        boxShadow: [BoxShadow(color: Colors.grey)],
        innerDrawerCallback: (isOpened) {
          _isOpen = isOpened;
          print(_isOpen);
        },
        swipe: true,
        rightAnimationType: InnerDrawerAnimation.linear,
        scale: IDOffset.horizontal(1),
        colorTransitionScaffold: Colors.transparent,
        offset: IDOffset.horizontal(0.15),
        rightChild: Scaffold(
          body: SafeArea(
            child: Column(children: [
              BottomAppBar(
                elevation: 01,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20, bottom: 16, left: 10),
                  child: Text(
                    'flutter.dart.lang',
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.timelapse),
                title: Text('Archive'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.insert_chart),
                title: Text('Insights'),
              ),
              ListTile(
                leading: Icon(Icons.av_timer),
                title: Text('Activity'),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('QR Code'),
              ),
              ListTile(
                leading: Icon(Icons.save_alt),
                title: Text('Saved'),
              ),
              ListTile(
                leading: Icon(Icons.stars),
                title: Text('Close Friends'),
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Discover People'),
              ),
            ]),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10),
                  Text(
                    'Settings',
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        scaffold: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            title: Text('flutter.dart.lang'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    key.currentState.toggle();
                  })
            ],
          ),
          body: Center(
            child:Text('Profile Page')
          ),
          bottomNavigationBar: BottomAppBar(
              child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.home),
                const Icon(Icons.search),
                const Icon(Icons.add_box),
                const Icon(Icons.favorite_border),
                const Icon(Icons.person),
              ],
            ),
          )),
        ));
  }
}
