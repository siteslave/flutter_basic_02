import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.edit),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'เมนูตั้งค่าการใช้งาน',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/88.jpg'),
                ),
                title: Text('ข้อมูลส่วนตัว'),
                subtitle: Text('จัดการข้อมูลส่วนตัวของผู้ใช้'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('เปลี่ยนรหัสผ่าน'),
                subtitle: Text('เปลี่ยนรหัสการเข้่าใช้งานแอพ'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
//        SizedBox(
//          height: 10.0,
//        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.edit),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'เมนูตั้งค่าการใช้งาน',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/88.jpg'),
                ),
                title: Text('ข้อมูลส่วนตัว'),
                subtitle: Text('จัดการข้อมูลส่วนตัวของผู้ใช้'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('เปลี่ยนรหัสผ่าน'),
                subtitle: Text('เปลี่ยนรหัสการเข้่าใช้งานแอพ'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.edit),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'เมนูตั้งค่าการใช้งาน',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/88.jpg'),
                ),
                title: Text('ข้อมูลส่วนตัว'),
                subtitle: Text('จัดการข้อมูลส่วนตัวของผู้ใช้'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('เปลี่ยนรหัสผ่าน'),
                subtitle: Text('เปลี่ยนรหัสการเข้่าใช้งานแอพ'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        )
      ],
    );
  }
}
