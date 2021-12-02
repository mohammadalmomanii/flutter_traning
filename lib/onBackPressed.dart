import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class onbackpressed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return onbackpressedState();
  }
}

class onbackpressedState extends State<onbackpressed> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("data11"),
          behavior: SnackBarBehavior.floating,
        ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("onbackpressed"),
          centerTitle: true,
        ),
      ),
    );
  }
}
