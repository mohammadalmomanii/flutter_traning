import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBarNoAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TapBarNoAppBarState();
  }
}

class TapBarNoAppBarState extends State<TapBarNoAppBar>
    with SingleTickerProviderStateMixin {
  late TabController myController;

  @override
  void initState() {
    myController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: TabBar(

          automaticIndicatorColorAdjustment: true,
            labelPadding: EdgeInsets.only(top: 25),
            controller: myController,
            tabs: [
              Tab(
                text: "test",
              ),
              Tab(
                text: "test",
              ),
              Tab(
                text: "test",
              )
            ]),
      ),
    );
  }
}
