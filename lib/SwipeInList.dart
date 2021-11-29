import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeInList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwipeInListState();
  }
}

class SwipeInListState extends State<SwipeInList> {
  List list = [
    "mohammad",
    "qusai",
    "mahmood",
    "tahssen",
    "murad",
    "alaa",
    "ali",
    "hisham",
    "hashim",
    "alaa",
    "ali",
    "hisham",
    "hashim",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("swipe in list"),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          //scrollDirection: ,
          itemCount: list.length,
          itemBuilder: (context, i) => Dismissible(
                crossAxisEndOffset: 1,
                background: Container(
                  color: Colors.blue,
                ),
                key: Key("$i"),
                child: Container(
                  height: 55,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  color: Colors.lightGreen,
                  child: Text("${list[i]}"),
                ),
              )),
    );
  }
}
