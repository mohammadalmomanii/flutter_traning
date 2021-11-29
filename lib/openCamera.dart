import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class openCamera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return openCameraState();
  }
}

class openCameraState extends State<openCamera> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenCameraState"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("showDialog"),
          onPressed: () {bottomDialog();},
        ),
      ),
    );
  }

  bottomDialog() {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.camera),
                      label: Text("Camera")),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.access_time_filled),
                      label: Text("Gellary"))
                ],
              ),
            ));
  }
}
