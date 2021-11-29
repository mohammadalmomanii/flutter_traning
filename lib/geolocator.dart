import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class geolocator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return geolocatorState();
  }
}

class geolocatorState extends State<geolocator> {
  var value;
  var posision;
  var posision2 = LatLng(31.23, 29.21);
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition  _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(" geolocatorState "),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: GoogleMap(

                mapType: MapType.terrain,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                onPressed: () {
                  checkGPS();
                },
                child: Text("check Gps")),
          ],
        ),
      ),
    );
  }

  Future checkGPS() async {
    value = await Geolocator
        .isLocationServiceEnabled(); //بفحص اذا اللوكيشن شغال ولا لا
    if (value == true) {
      var perGranted =
          await Geolocator.checkPermission(); //بفحص اذا الاذن ماخوذ او لا
      if (perGranted == LocationPermission.denied) //اذا لا
        perGranted = await Geolocator.requestPermission(); //بطلب اذن
      else if (perGranted == LocationPermission.always) {
        // اذا الاذن ماخوذ
        posision = await Geolocator.getCurrentPosition();
        List<Placemark> placemarks = await placemarkFromCoordinates(
            posision.latitude, posision.longitude);


        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("latitude:${placemarks[0].country}//"
              "${placemarks[0].administrativeArea}//${placemarks[0].subLocality}"
              "${placemarks[0].street}//${placemarks[0].name}//"),
          behavior: SnackBarBehavior.floating,
        ));
      }
    } else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("location is  Close"),
          behavior: SnackBarBehavior.floating));
  }
}
