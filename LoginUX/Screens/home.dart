import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login/login/login.dart';
import 'package:login/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storage = Storage();
    return WillPopScope(
      onWillPop: () async {
        //exit(0);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                if (value == 'SignOut') {
                  storage.setSignout();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                } else
                  return null;
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(value: 'SignOut', child: Text('Sign Out'))
                ];
              },
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Text('Home Screen'),
          ),
        ),
      ),
    );
  }
}
