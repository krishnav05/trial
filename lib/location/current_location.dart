import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Userlocation extends StatefulWidget {
  @override
  _UserlocationState createState() => _UserlocationState();
}

class _UserlocationState extends State<Userlocation> {
  CameraPosition cameraPostition =
      CameraPosition(target: LatLng(28.613939, 77.209023));
  GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: cameraPostition,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              _controller:
              controller;
            });
          },
          onTap: (coordinates) {
            _controller.animateCamera(CameraUpdate.newLatLng(coordinates));
          },
        ),
      ),
    );
  }
}
