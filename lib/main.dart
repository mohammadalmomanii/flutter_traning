import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_bar_flutter/BottomNavigationBar.dart';
import 'package:tap_bar_flutter/FireBase/login_anonymous.dart';
import 'package:tap_bar_flutter/Language/lang.dart';
import 'package:tap_bar_flutter/PageView.dart';
import 'package:tap_bar_flutter/TapBar.dart';
import 'package:tap_bar_flutter/TapBarNoAppBar.dart';
import 'package:tap_bar_flutter/http/view.dart';

//SHA1: AD:1C:53:66:7A:A2:64:63:A0:47:AC:64:0A:DD:50:F8:D8:D8:63:ED
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.red,
      ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isArabic = await prefs.getBool('key') ?? false;
  runApp(MyApp(isArabic));
}

class MyApp extends StatelessWidget {
  final bool isArabic;

  MyApp(this.isArabic);

  @override
  Widget build(BuildContext context) {
    GetMaterialApp app = GetMaterialApp(
      translations: lang(),
      locale: isArabic == true ? Locale('ar', 'JO') : Locale('en', 'US'),
      home: view(),
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
