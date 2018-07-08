import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:my_app/utils/database_helper.dart';

class AddMemberScreen extends StatefulWidget {
  var id;

  AddMemberScreen(this.id);

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState(id);
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  var id;
  _AddMemberScreenState(this.id);

  DatabaseHelper databaseHelper = DatabaseHelper.internal();

  DateTime birthDate;
  String strBirthDate;

  final _formKey = GlobalKey<FormState>();

  TextEditingController ctrlFirstName = TextEditingController();
  TextEditingController ctrlLastName = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlTelephone = TextEditingController();

  String sex = 'ชาย';
  bool isActive = true;

  Future getDetail(int id) async {
    var res = await databaseHelper.getDetail(id);
    var detail = res[0];
    print('=========================');
    print(detail);
    print('=========================');
    setState(() {
      ctrlEmail.text = detail['email'];
      ctrlFirstName.text = detail['first_name'];
      ctrlLastName.text = detail['last_name'];
      ctrlTelephone.text = detail['telephone'];

      String _birth = detail['birth_date'];
      DateTime _birthDate = DateTime.parse(_birth);

      var strDate = new DateFormat.MMMMd('th_TH').format(
          new DateTime(_birthDate.year, _birthDate.month, _birthDate.day));
      strBirthDate = '$strDate ${_birthDate.year + 543}';
      birthDate = _birthDate;
    });
  }

  @override
  void initState() {
    super.initState();

    if (id != null) {
      getDetail(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime _currentDate;
    int _year = DateTime.now().year;
    int _month = DateTime.now().month;
    int _day = DateTime.now().day;

    Future<Null> _showDatePicker() async {
      final DateTime picked = await showDatePicker(
          locale: const Locale('th'),
          context: context,
          initialDate: DateTime(_year, _month, _day),
          firstDate: new DateTime(1920, 1, 1),
          lastDate: new DateTime(_year, _month, _day));
      if (picked != null && picked != _currentDate) {
        setState(() {
          var strDate = new DateFormat.MMMMd('th_TH')
              .format(new DateTime(picked.year, picked.month, picked.day));
          strBirthDate = '$strDate ${picked.year + 543}';
          birthDate = picked;
        });
      }
    }

    Future<Null> saveData() async {
      print(ctrlFirstName.text);
      print(ctrlLastName.text);
      print(ctrlEmail.text);
      print(ctrlTelephone.text);
      print(sex);
      print(birthDate);
      print(isActive);

      if (_formKey.currentState.validate() && birthDate != null) {
        Map member = {
          'firstName': ctrlFirstName.text,
          'lastName': ctrlLastName.text,
          'email': ctrlEmail.text,
          'telephone': ctrlTelephone.text,
          'birthDate': birthDate.toString(),
          'id': id
        };
        if (id != null) {
          await databaseHelper.updateData(member);
        } else {
          await databaseHelper.saveData(member);
        }
        Navigator.of(context).pop({'ok': true});
      } else {
        print('Failed');
      }
    }

    String _validateEmail(String value) {
      if (value.isEmpty) return 'กรุณาระบุอีเมล์';

      final RegExp nameExp = new RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!nameExp.hasMatch(value)) return 'กรุณาระบุให้ถูกรูปแบบ';
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add new member'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () => saveData()),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'รายละเอียดสมาชิก',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'First name',
                                    labelStyle: TextStyle(fontSize: 20.0)),
                                controller: ctrlFirstName,
                                validator: (String value) {
                                  if (value.isEmpty) return 'กรุณาระบุชื่อ';
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Last name',
                                    labelStyle: TextStyle(fontSize: 20.0)),
                                controller: ctrlLastName,
                                validator: (String value) {
                                  if (value.isEmpty) return 'กรุณาระบุนามสกุล';
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Birth Date',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            FlatButton(
                                onPressed: () => _showDatePicker(),
                                child: Text(
                                  strBirthDate ?? 'เลือกวันที่',
                                  style: TextStyle(fontSize: 20.0),
                                ))
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(fontSize: 20.0)),
                          controller: ctrlEmail,
                          validator: _validateEmail,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Telephone',
                              labelStyle: TextStyle(fontSize: 20.0)),
                          controller: ctrlTelephone,
                        ),
                        SwitchListTile(
                          value: true,
                          onChanged: (bool value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                          title: Text('เปิดการใช้งานระบบ'),
                        ),
                        ListTile(
                          title: const Text('เพศ'),
                          trailing: new DropdownButton<String>(
                            value: sex,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "ThaiSansNeue",
                                color: Colors.black),
                            onChanged: (String newValue) {
                              setState(() {
                                sex = newValue;
                              });
                            },
                            items: <String>['ชาย', 'หญิง'].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: new Text(value),
                                  width: 120.0,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
