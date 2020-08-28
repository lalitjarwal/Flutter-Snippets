import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: title,
      home: ColorMixer(),
      //NavigationBarDemo(),
    );
  }
}
class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  var _r = 126.0;
  var _g = 126.0;
  var _b = 126.0;

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromARGB(255, _r.toInt(), _g.toInt(), _b.toInt());
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Mixer'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: _color, borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Red"),
                  SizedBox(width: 10),
                  Expanded(
                    child: Slider(
                        //autofocus: true,
                        activeColor: Colors.red,
                        inactiveColor: _color,
                        value: _r,
                        max: 255,
                        min: 0,
                        onChanged: (r) {
                          setState(() {
                            _r = r;
                          });
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Green"),
                  // SizedBox(width: 10),
                  Expanded(
                    child: Slider(
                        activeColor: Colors.green,
                        inactiveColor: _color,
                        value: _g,
                        max: 255,
                        min: 0,
                        onChanged: (g) {
                          setState(() {
                            _g = g;
                          });
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Blue"),
                  SizedBox(width: 10),
                  Expanded(
                    child: Slider(
                        activeColor: Colors.blue,
                        inactiveColor: _color,
                        value: _b,
                        max: 255,
                        min: 0,
                        onChanged: (b) {
                          setState(() {
                            _b = b;
                          });
                        }),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LongPress & Copy :'),
                  SizedBox(width: 10),
                  Ink(
                    color: Color(0xffececec),
                    padding: const EdgeInsets.all(8),
                    child: SelectableText(
                      '#${_color.toString().substring(10, 16)}',
                      textScaleFactor: 1.5,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
