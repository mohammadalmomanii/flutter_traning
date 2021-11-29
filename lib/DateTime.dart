import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DateTime1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DateTime1State();
  }
}

class DateTime1State extends State<DateTime1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTime"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("showDate"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("***${DateTime.now()} : ${DateTime.now().minute}***"),
              behavior: SnackBarBehavior.floating,
            ));
          },
        ),
      ),
    );
  }
}
