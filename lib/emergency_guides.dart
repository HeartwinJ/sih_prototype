import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyEmergencyGuidesPage extends StatefulWidget {
  @override
  _MyEmergencyGuidesPageState createState() => _MyEmergencyGuidesPageState();
}

class _MyEmergencyGuidesPageState extends State<MyEmergencyGuidesPage>{
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
          title: Text('Emergency Guides'),
        ),
      ),
    );
  }
}
