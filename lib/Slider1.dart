import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slider1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Slider1State();
  }
}

class Slider1State extends State<Slider1> {
  var current = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Slider(
            thumbColor: Colors.purple,
            label: "SLIDER",
            value: current,
            onChanged: (val) {
              setState(() {
                current = val;
              });
            },
            max: 100.0,
            min: 0.0,
          ),
          Text("${current.toInt()}/100")
        ],
      ),
    );
  }
}
