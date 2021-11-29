import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollState();
  }
}

class ScrollState extends State<Scroll> {
  late ScrollController myController;
  var i=0.0;
  @override
  void initState() {
    myController=new ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () {
            i=0.0;
            myController.animateTo(myController.position.minScrollExtent, duration:Duration(seconds: 1), curve: Curves.decelerate);
          }, icon: Icon(Icons.ten_k)),
          IconButton(onPressed: () {
            i+=20.0;
            myController.animateTo(i, duration:Duration(seconds: 1), curve: Curves.decelerate);

          }, icon: Icon(Icons.ten_k_outlined))
        ],
      ),
      appBar: AppBar(
        title: Text("Scroll"),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: myController,
          itemCount: 20,
          itemBuilder: (context, i) => Container(
                height: 75,
                color: Colors.lightBlue,
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("Container : $i"),
              )),
    );
  }
}
