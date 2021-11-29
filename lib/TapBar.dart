import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBar extends StatefulWidget {
  GlobalKey<TapBarState> tabKey = GlobalKey<TapBarState>();

  @override
  State<StatefulWidget> createState() {
    return TapBarState();
  }
}

class TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {
  late TabController myController;

  @override
  void initState() {
    myController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            controller: myController,
            onTap: (itemId) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$itemId"),
                behavior: SnackBarBehavior.floating,
                duration: Duration(milliseconds: 200),
              ));
            },
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(
                //child: Text("yallow"),
                //icon: Icon(Icons.ten_k_outlined),
                text: "yallow",
              ),
              Tab(
                text: "red",
              ),
              Tab(
                text: "green",
              ),
              Tab(text: "black")
            ]),
      ),
      body: TabBarView(controller: myController, children: [
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.black,
        )
      ]),
    );
  }
}
