import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class language extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return languageState();
  }
}

class languageState extends State<language> {
  late SharedPreferences pref;

  start() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("title".tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                if (Get.locale.toString() == 'en') {
                  Get.updateLocale(Locale('ar'));
                  pref.setBool('key', true);
                } else {
                  Get.updateLocale(Locale('en'));
                  pref.setBool('key', false);
                }
              },
              child: Text("change".tr)),
          ElevatedButton(
              onPressed: () {
                print("Language is : ${pref.getBool('key')}");
              },
              child: Text("change".tr))
        ],
      ),
    );
  }
}
