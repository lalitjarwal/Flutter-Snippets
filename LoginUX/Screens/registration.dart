import 'package:flutter/material.dart';
import 'package:login/login/home.dart';
import 'package:login/login/login.dart';
import 'package:login/main.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  final _controllerPhone = TextEditingController();
  final _controllerPass1 = TextEditingController();

  final _controllerPass2 = TextEditingController();
  @override
  void dispose() {
    _controllerPass1.clear();
    _controllerPass2.clear();
    _controllerPhone.clear();
    _controllerPass1.dispose();
    _controllerPass2.dispose();
    _controllerPhone.dispose();
    super.dispose();
  }

  final storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Phone number is required*';
                      else
                        return null;
                    },
                    controller: _controllerPhone,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 22),
                        hintText: 'Enter Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Password is required*';
                      else
                        return null;
                    },
                    controller: _controllerPass1,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 22),
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Password is required*';
                      else
                        return null;
                    },
                    controller: _controllerPass2,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 22),
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 46,
                    child: RaisedButton(
                        shape: StadiumBorder(),
                        color: Colors.purple,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (_controllerPass1.text !=
                                _controllerPass2.text) {
                              _key.currentState.showSnackBar(SnackBar(
                                content: Text('Password does not match'),
                              ));
                            } else {
                              storage.store(
                                  _controllerPhone.text, _controllerPass1.text);
                              storage.setLogin();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                  (route) => false);
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        )),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('Already a User?'),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          textScaleFactor: 1.2,
                        ),
                        textColor: Colors.purple,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
