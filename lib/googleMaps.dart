import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class googleMaps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return googleMapsState();
  }
}

class googleMapsState extends State<googleMaps> {
  late GoogleMapController gmc;
  late bool GpsState;
  late LatLng latLng=LatLng(0, 0);
  late LocationPermission permissonState;
  late Position currentPosision;

  @override
  void initState() {
    checkGPS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("googleMaps"),
        centerTitle: true,
      ),
      body: Column(children: [
        latLng.latitude != 0
            ? Expanded(
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: {
                      Marker(
                          draggable: true,
                          markerId: MarkerId("test"),
                          position: latLng,
                          onDragEnd: (LatLng t) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("data$t")));
                          }),
                      Marker(
                        infoWindow: InfoWindow(title: "rrerer"),
                        markerId: MarkerId("test1"),
                        position: LatLng(32.5543, 36.545),
                      ),
                      Marker(
                        markerId: MarkerId("test2"),
                        position: LatLng(32.554, 36.54),
                      )
                    },
                    initialCameraPosition:
                        CameraPosition(target: latLng, zoom: 10),
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      gmc = controller;
                    },
                  ),
                  Positioned(
                      child: ElevatedButton(
                    onPressed: () async {
                      gmc.animateCamera(
                          CameraUpdate.newLatLng(LatLng(36.2555, 3.2555)));
                    },
                    child: Text("zarqa"),
                  ))
                ]),
              )
            : CircularProgressIndicator(),
      ]),
    );
  }

  Future checkGPS() async {
    GpsState = await Geolocator.isLocationServiceEnabled();
    permissonState = await Geolocator.checkPermission();
    if (GpsState == true) {
      if (permissonState == LocationPermission.denied)
        permissonState = await Geolocator.requestPermission();
      else {
        currentPosision = await Geolocator.getCurrentPosition();
        latLng =
            await LatLng(currentPosision.latitude, currentPosision.longitude);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("open your GPS"),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
