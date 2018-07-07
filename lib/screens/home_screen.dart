import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/screens/add_screen.dart';

import 'package:my_app/screens/page_one.dart';
import 'package:my_app/screens/page_two.dart';
import 'package:my_app/screens/page_three.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle myStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  TextStyle myStyle2 = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  int currentIndex = 0;
  List pages = [PageOne(), PageTwo(), PageThree()];

  bool hasImage = true;

  @override
  Widget build(BuildContext context) {
    Widget floatingAction = FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          var response = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddScreen('Hello flutter')));

          if (response != null) {
            print(response['name'] ?? '-');
          }
        },
        child: Icon(Icons.add));

    Widget appBar = AppBar(
      title: Text(
        'โปรแกรมทดสอบ',
        style: myStyle,
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed('/photo')),
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.of(context).pushNamed('/add')),
      ],
    );

    Widget bottomNavBar = BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'หน้าหลัก',
                style: myStyle2,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(
                'ข้อมูลส่วนตัว',
                style: myStyle2,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(
                'ตั้งค่า',
                style: myStyle2,
              )),
        ]);

    Widget drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: hasImage
                ? CircleAvatar(
                    backgroundImage: AssetImage('assets/images/88.jpg'),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Text(
                      'AB',
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0),
                    ),
                  ),
            accountName: Text(
              'Satit Rianpit',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('rianpit@gmail.com'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/pic1.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'หน้าหลัก',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('หน้าเมนูใช้งานหลัก'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'ข้อมูลผู้ใช้',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('ข้อมูลผู้ใช้'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text(
              'ผู้ใช้งานระบบ',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('ข้อมูลผู้ใช้งานในระบบ'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/users');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'ตั้งค่าการใช้งาน',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('ตั้งค่าการใช้งาน'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/add');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'ออกจากแอพลิเคชัน',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('ตั้งค่าการใช้งาน'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: pages[currentIndex],
      drawer: drawer,
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
