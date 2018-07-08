import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/screens/add_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/main_screen.dart';
import 'package:my_app/screens/page_one.dart';
import 'package:my_app/screens/users_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'ThaiSansNeue',
          scaffoldBackgroundColor: Colors.white70,
          primaryColor: Colors.pink,
          accentColor: Colors.amber),
      title: 'My App',
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => AddScreen('Hello'),
        '/photo': (BuildContext context) => PageOne(),
        '/users': (BuildContext context) => UsersScreen(),
      },
    );
  }
}
