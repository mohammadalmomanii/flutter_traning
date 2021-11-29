import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageView1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageView1State();
  }
}

class model {
  var value;

  model(this.value);
}

class PageView1State extends State<PageView1> {
  late PageController myController;
  var current = 0;
  late List<Color> list = [
    Colors.red,
    Colors.orangeAccent,
    Colors.deepPurpleAccent,
    Colors.greenAccent,
    Colors.orange,
    Colors.tealAccent,
    Colors.purple,
    Colors.cyan,
    Colors.lightGreen
  ];

  @override
  void initState() {
    list.add(Colors.red);
    list.add(Colors.amberAccent);
    list.add(Colors.blue);
    list.add(Colors.green);
    list.add(Colors.purpleAccent);
    myController = PageController(viewportFraction: 1, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index) {
                      current = index;
                    },
                    itemCount: list.length,
                    controller: myController,
                    itemBuilder: (item, i) {
                      return Container(
                        color: list[i],
                      );
                    }),
              ),
              Positioned(
                top: 75,
                left: 300,
                child: IconButton(
                  onPressed: () {
                    var newPage = current + 1;
                    myController.animateToPage(newPage,
                        duration: Duration(seconds: 1), curve: Curves.easeIn);
                    print("current :$current///// newPage :$newPage");
                  },
                  icon: Icon(Icons.arrow_right),
                ),
              ),
              Positioned(
                  top: 75,
                  child: IconButton(
                    onPressed: () {
                      var newPage = current - 1;
                      myController.animateToPage(newPage,
                          duration: Duration(seconds: 1),
                          curve: Curves.bounceIn);
                      print("current :$current///// newPage :$newPage");
                    },
                    icon: Icon(Icons.arrow_left),
                    alignment: Alignment.centerRight,
                  )),
            ],
          ),
          Container(
            height: 200,
            child: PageView(
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.amberAccent,
                ),
                Container(
                  color: Colors.white,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: PageView(
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.amberAccent,
                ),
                Container(
                  color: Colors.white,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
