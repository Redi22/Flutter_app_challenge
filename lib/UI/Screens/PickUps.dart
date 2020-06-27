import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/Donation.dart';
import 'package:flutterappchallenge/UI/Widgets/LocationViewer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickUps extends StatefulWidget {
  @override
  _PickUpsState createState() => _PickUpsState();
}

class _PickUpsState extends State<PickUps> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LocationViewer(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 50,
                  color: Color(0x9902DB96),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                        child: Text(
                      "Pick Up",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    ));
  }
}
