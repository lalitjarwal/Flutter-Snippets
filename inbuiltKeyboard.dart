import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inbuilt Keyboard'),
        ),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  var _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  var buttonValue;
  var text = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Center(
                child: Container(
              width: 150,
              child: TextField(
                  maxLength: 8,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  readOnly: true,
                  style: TextStyle(fontSize: 24),
                  controller: _controller,
                  decoration: InputDecoration(
                    fillColor: Colors.purpleAccent,
                    disabledBorder: OutlineInputBorder(),
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(),
                  )),
            )),
            Spacer(),
            Container(
              width: double.infinity,
              child: GridView.count(
                addAutomaticKeepAlives: true,
                childAspectRatio: 2.5,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: <Widget>[
                  KeyBoardKey(
                    text: '1',
                    onTap: () {
                      buttonValue = '1';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '2',
                    onTap: () {
                      buttonValue = '2';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '3',
                    onTap: () {
                      buttonValue = '3';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '4',
                    onTap: () {
                      buttonValue = '4';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                      text: '5',
                      onTap: () {
                        buttonValue = '5';
                        if (text.length < 8)
                          text = text + '$buttonValue';
                        else
                          text = text;
                        _controller.text = text;
                        print(_controller.text);
                        print('text=$text');
                      }),
                  KeyBoardKey(
                    text: '6',
                    onTap: () {
                      buttonValue = '6';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '7',
                    onTap: () {
                      buttonValue = '7';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '8',
                    onTap: () {
                      buttonValue = '8';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '9',
                    onTap: () {
                      buttonValue = '9';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    type: ButtonType.ICON,
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      _controller.text = text;
                      if (text.isNotEmpty)
                        _controller.text =
                            _controller.text.substring(0, text.length - 1);
                      text = _controller.text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    text: '0',
                    onTap: () {
                      buttonValue = '0';
                      if (text.length < 8)
                        text = text + '$buttonValue';
                      else
                        text = text;
                      _controller.text = text;
                      print(_controller.text);
                      print('text=$text');
                    },
                  ),
                  KeyBoardKey(
                    type: ButtonType.ICON,
                    icon: Icon(
                      Icons.send,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      if (text.isEmpty) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Center(
                            child: Text(
                              'Pin is Empty',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          elevation: 0.0,
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        ));
                        _controller.text = '';
                      } else if (text.length < 8)
                        Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          content: Center(
                            child: Text(
                              '*Pin lentgth must be 8',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          elevation: 0.0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        ));
                      print('text=$text');
                    },
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

enum ButtonType { TEXT, ICON }

class KeyBoardKey extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final type;
  final Icon icon;
  KeyBoardKey({this.text, this.onTap, this.icon, this.type = ButtonType.TEXT})
      : assert(type != null);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: onTap,
      child: Ink(
        color: Colors.grey[200],
        child: type == ButtonType.TEXT
            ? Center(
                child: Text(
                  text,
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              )
            : icon,
      ),
    ));
  }
}
