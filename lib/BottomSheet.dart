import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheet1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomSheet1State();
  }
}

class BottomSheet1State extends State<BottomSheet1>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        title: Text("BottomSheet"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(

                  enableDrag: false,
                  isScrollControlled: false,
                  isDismissible: false,
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (builder) => Container(
                        child: ElevatedButton(
                          child: Text("close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        alignment: Alignment.center,
                        height: 250,
                        color: Colors.lightBlue,
                        margin: EdgeInsets.only(top: 30),
                      ));
            },
            child: Text("showDialog")),
      ),
    );
  }
}
