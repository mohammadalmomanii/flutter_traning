import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigatonBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigatonBarState();
  }
}

class BottomNavigatonBarState extends State<BottomNavigatonBar> {
  var seletedIndex=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black12,
        fixedColor: Colors.red,
        mouseCursor: MouseCursor.defer,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        currentIndex: seletedIndex,
        onTap: (index){
          setState(() {
            seletedIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ten_k_outlined), label: "page1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
        ],
      ),
    );
  }
}
