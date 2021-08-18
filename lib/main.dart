import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'settings.dart';
import 'emergency_guides.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aegis',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        //brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(10.99, 79.85);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set getPolygon() {
    Set<Polygon> polygons = {
      Polygon(
          polygonId: PolygonId('area1'),
          points: [
            LatLng(10.984986, 79.843534),
            LatLng(10.985373, 79.845415),
            LatLng(10.994226, 79.846979),
            LatLng(10.994742, 79.839473),
          ],
        fillColor: Colors.red.withOpacity(0.25),
        strokeColor: Colors.transparent,
      ),
    };
    return polygons;
  }

  void onSosButtonClicked() {
    print('Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
              mapType: MapType.normal,
              polygons: getPolygon(),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 200.0,
              height: 75.0,
              child: FittedBox(
                child: FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('SOS'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: onSosButtonClicked,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: SpeedDial(
        marginRight: 12.0,
        marginBottom: 12.0,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.notifications_active),
            label: 'Volunteer',
            onTap: () {}
          ),
          SpeedDialChild(
            child: Icon(Icons.import_contacts),
            label: 'Emergency Guides',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyEmergencyGuidesPage()
                  )
              );
            }
          ),
          SpeedDialChild(
            child: Icon(Icons.settings),
            label: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MySettingsPage()
                )
              );
            }
          ),
        ],
      ),
    );
  }
}
