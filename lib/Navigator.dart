
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_bar_flutter/TapBar.dart';

import 'BottomNavigationBar.dart';


class Navigator1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Navigator1State();
  }
}

class Navigator1State extends State<Navigator1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton.icon(label:Text("new root") ,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> BottomNavigatonBar()));
                },
                icon: Icon(Icons.map)),
          ),
          Center(
            child: ElevatedButton.icon(label:Text("old root") ,
                onPressed: () {
                  Navigator.of(context).pushNamed("BottomNavigation");
                },
                icon: Icon(Icons.map)),
          ),
        ],
      ),
    );
  }
}
