import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyEmergencyContactsPage extends StatefulWidget {
  @override
  _MyEmergencyContactsPageState createState() => _MyEmergencyContactsPageState();
}

class _MyEmergencyContactsPageState extends State<MyEmergencyContactsPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Emergency Contacts'),
        ),
      ),
    );
  }
}
