import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(child: Image(image: AssetImage('assets/images/pic1.jpg'))),
        SizedBox(
          height: 20.0,
        ),
        Card(child: Image(image: AssetImage('assets/images/pic1.jpg'))),
      ],
    );
  }
}
