import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isLoading = false;

  Future<Null> doLogin() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post('http://www.udonsoft.com:3333/login',
        body: {'username': ctrlUsername.text, 'password': ctrlPassword.text});

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);

      if (jsonResponse['ok']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', jsonResponse['token']);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Row(
            children: <Widget>[new Text("เกิดข้อผิดพลาด")],
          ),
        ));
      }
    } else {
      print('Connection error!');
    }
  }

  void _doLogin() {
    print(ctrlUsername.text);
    print(ctrlPassword.text);

    if (ctrlUsername.text == 'admin' && ctrlPassword.text == 'admin') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  Future<Null> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Image(
                      width: 150.0,
                      height: 150.0,
                      image: AssetImage('assets/images/logo_coke.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Form(
                          child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: ctrlUsername,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ThaiSansNeue',
                                color: Colors.black45),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email address',
                                filled: true,
                                fillColor: Colors.white),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: ctrlPassword,
                            obscureText: true,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ThaiSansNeue',
                                color: Colors.black45),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: 'Password',
                                filled: true,
                                fillColor: Colors.white),
                          ),
//                          SizedBox(
//                            height: 20.0,
//                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                isLoading ? CircularProgressIndicator() : null,
                          ),
                          Material(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30.0)),
                            shadowColor: Colors.pink[500],
                            elevation: 5.0,
                            child: MaterialButton(
                              minWidth: 290.0,
                              height: 55.0,
                              onPressed: () => doLogin(),
                              color: Colors.pinkAccent,
                              child: Text(
                                'Login to application',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                              onPressed: () => doLogin(),
                              child: Text(
                                'Register new user',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ))
                        ],
                      )),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
