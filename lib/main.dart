import 'package:flutter/material.dart';
import 'package:tap_bar_flutter/AwesomeDialog.dart';
import 'package:tap_bar_flutter/BottomNavigationBar.dart';
import 'package:tap_bar_flutter/BottomSheet.dart';
import 'package:tap_bar_flutter/DateTime.dart';
import 'package:tap_bar_flutter/InternalStorage.dart';
import 'package:tap_bar_flutter/Navigator.dart';
import 'package:tap_bar_flutter/PageView.dart';
import 'package:tap_bar_flutter/Scroll.dart';
import 'package:tap_bar_flutter/Slider1.dart';
import 'package:tap_bar_flutter/TapBar.dart';
import 'package:tap_bar_flutter/TapBarNoAppBar.dart';
import 'package:tap_bar_flutter/searchDelegate.dart';

import 'DropDownSearch1.dart';
import 'SwipeInList.dart';
import 'geolocator.dart';
import 'googleMaps.dart';
import 'openCamera.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialApp app = MaterialApp(
      home: InternalStorage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "TapBar": (context) => TapBar(),
        "BottomNavigation": (context) => BottomNavigatonBar(),
        "PageView": (context) => PageView1(),
        "TapBarNo": (context) => TapBarNoAppBar(),
      },
    );
    return app;
  }
}
