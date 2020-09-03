import 'package:flutter/material.dart';
import 'package:login/login/home.dart';
import 'package:login/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: title,
      home: FutureBuilder(
          future: Storage().loginStatus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data)
                return Home();
              else
                return LoginScreen();
            } else
              return Center(
                child: FlutterLogo(
                  size: 120,
                ),
              );
          }),
    );
  }
}

class Storage {
  Future<SharedPreferences> pref;
  Storage() {
    this.pref = SharedPreferences.getInstance();
  }

  void store(String ph, String pswd) async {
    SharedPreferences _pref = await pref;
    _pref.setString('phone', ph);
    _pref.setString('pswd', pswd);
  }

  Future<bool> check(String ph, String pswd) async {
    SharedPreferences _pref = await pref;
    if (_pref.getString('phone') == ph && _pref.getString('pswd') == pswd)
      return true;
    return false;
  }

  void setLogin() async {
    SharedPreferences _pref = await pref;
    _pref.setBool('loggedin', true);
  }

  Future<bool> get loginStatus async {
    SharedPreferences _pref = await pref;
    return _pref.getBool('loggedin') ?? false;
  }

  void setSignout() async {
    SharedPreferences _pref = await pref;
    _pref.setBool('loggedin', false);
  }

  Future<String> get details async {
    SharedPreferences _pref = await pref;
    return _pref.getString('phone');
  }
}
