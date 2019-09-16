import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(24.150, -110.32), zoom: 10),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          mapType: MapType.hybrid,
//            trackCameraPosition: true
        ),
        /*Positioned(
            bottom: 50,
            right: 10,
            child: FlatButton(
              child: Icon(Icons.pin_drop),
              color: Colors.green,
              onPressed: () => _addMarker(),
            ))*/
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  /*_addMarker() {
    final marker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(),
    )


  }*/
}
