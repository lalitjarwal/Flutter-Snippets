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
        home:SavePageState());
  }
}
