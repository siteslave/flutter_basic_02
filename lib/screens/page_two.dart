import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('assets/images/pic1.jpg')),
            Image(image: AssetImage('assets/images/pic1.jpg')),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image(
                      fit: BoxFit.fill,
                      height: 100.0,
                      image: AssetImage('assets/images/pic1.jpg')),
                ),
                Expanded(
                  child: Image(
                      fit: BoxFit.fill,
                      height: 100.0,
                      image: AssetImage('assets/images/pic1.jpg')),
                ),
                Expanded(
                  child: Image(
                      fit: BoxFit.fill,
                      height: 100.0,
                      image: AssetImage('assets/images/pic1.jpg')),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
