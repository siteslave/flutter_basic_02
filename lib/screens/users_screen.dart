import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var users;
  bool isLoading = true;

  Future<Null> getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');

    final response =
        await http.get('http://www.udonsoft.com:3333/users?token=$token');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        isLoading = false;
        users = jsonResponse['rows'];
      });
    } else {
      print('Connection error!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users list'),
        ),
        body: Card(
          child: RefreshIndicator(
            onRefresh: getUsers,
            child: isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemBuilder: (context, int index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  users[index]['picture']['medium']),
                            ),
                            onTap: () {},
                            title: Text(
                              '${users[index]['name']['first']} ${users[index]['name']['last']}',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            subtitle: Text('${users[index]['email']}'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          Divider()
                        ],
                      );
                    },
                    itemCount: users != null ? users.length : 0,
                  ),
          ),
        ));
  }
}
