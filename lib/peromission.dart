import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class peromission extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return peromissionState();
  }
}

class peromissionState extends State<peromission> {

  peromissions()async{

    if (await Permission.camera.status.isDenied) {
      Permission.camera.request();
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }

  @override
  void initState() {

    peromissions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("peromission"),centerTitle: true,),);
  }
}