import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  var params;

  AddScreen(this.params);

  @override
  _AddScreenState createState() => _AddScreenState(params);
}

class _AddScreenState extends State<AddScreen> {
  var params;

  _AddScreenState(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add data screen'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            'Params: $params',
            style: TextStyle(fontSize: 20.0),
          ),
          Text('Add data'),
          RaisedButton(
            color: Colors.pink,
            onPressed: () =>
                Navigator.of(context).pop({'id': 10000, 'name': 'Flutter'}),
            child: Text('Back'),
          )
        ],
      ),
    );
  }
}
