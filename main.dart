import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffececec),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width / 1.2,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/login.png',
            color: Color(0xffececec),
            colorBlendMode: BlendMode.multiply,
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            width: size.width / 1.2,
            height: size.height / 2.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    textScaleFactor: 1.8,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Username', border: OutlineInputBorder())),
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder())),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.purple[800]),
                        )),
                  )
                ]),
          ),
          Row(
            children: <Widget>[
              Radio(
                value: true,
                groupValue: true,
                onChanged: (bool) {},
                activeColor: Colors.purple,
              ),
              Text(
                'Remember me',
                style: TextStyle(color: Colors.grey[700]),
              ),
              Spacer(),
              Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 8.0,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: size.width * 30 / 100,
                      height: size.height * 6 / 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff18ffff), Color(0xff0277bd)]),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'SIGNUP',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.45 / 100),
            child: Row(children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 10,
                ),
              ),
              Text(
                'Social Login',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 20,
                ),
              )
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SignInButton(
              Buttons.Facebook,
              onPressed: () {},
              shape: CircleBorder(),
              mini: true,
            ),
            SignInButton(
              Buttons.LinkedIn,
              shape: CircleBorder(),
              onPressed: () {},
              mini: true,
            ),
            SignInButton(
              Buttons.Email,
              onPressed: () {},
              shape: CircleBorder(),
              mini: true,
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New User?'),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Signup',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.purple[800]),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
