import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class openCamera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return openCameraState();
  }
}

class openCameraState extends State<openCamera> {
  File? myImage = null;
  getCamera() async {
    var picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null)
      setState(() {
        myImage = File(picked.path);
      });
  }
  getGellary() async{
    var picked=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(picked!=null)
      setState(() {
        myImage=File(picked.path);
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenCameraState"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                myImage != null
                    ? Image.file(
                        myImage!,
                        fit: BoxFit.fill,
                      )
                    : Text("no image"),
                ElevatedButton(
                  child: Text("showDialog"),
                  onPressed: () {
                    bottomDialog();
                  },
                ),
              ]),
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
                      onPressed: getCamera,
                      icon: Icon(Icons.camera),
                      label: Text("Camera")),
                  ElevatedButton.icon(
                      onPressed: getGellary,
                      icon: Icon(Icons.access_time_filled),
                      label: Text("Gellary"))
                ],
              ),
            ));
  }
}
