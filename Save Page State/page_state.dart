import 'package:dartlang/save_page_state/first_page.dart';
import 'package:dartlang/save_page_state/second_page.dart';
import 'package:flutter/material.dart';

class SavePageState extends StatefulWidget {
  @override
  _SavePageStateState createState() => _SavePageStateState();
}

class _SavePageStateState extends State<SavePageState> {
  final List<Widget> pages = [
    FirstPage(
      key: PageStorageKey('Page1'),
    ),
    SecondPage(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'First Page'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Second Page'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
