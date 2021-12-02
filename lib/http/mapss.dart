import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapss extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mapssState();
  }
}

class mapssState extends State<mapss> {
  Future checkGPS() async {
    var value = await Geolocator.isLocationServiceEnabled();	//بفحص اذا اللوكيشن شغال ولا لا
    if (value == true) {
      var perGranted = await Geolocator.checkPermission();	//بفحص اذا الاذن ماخوذ او لا
      if (perGranted == LocationPermission.denied)		//اذا لا
        perGranted = await Geolocator.requestPermission();	//بطلب اذن
      else if (perGranted == LocationPermission.always) {	// اذا الاذن ماخوذ
        var posision = await Geolocator.getCurrentPosition();	//بجيب اللوكيشن
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "latitude:${posision.latitude}\n longitude:${posision.longitude}"),
          behavior: SnackBarBehavior.floating,
        ));
      }
    } else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("location is  Close"),
          behavior: SnackBarBehavior.floating));
  }

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
      title: Text("dddd"),
      centerTitle: true,
    ),
    body:GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(32,23)),myLocationButtonEnabled: true,myLocationEnabled: true,),
    );
  }
}
