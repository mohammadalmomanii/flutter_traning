import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:tap_bar_flutter/http/api.dart';
import 'package:tap_bar_flutter/http/mapss.dart';
import 'package:url_launcher/url_launcher.dart';

class view extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return viewState();
  }
}

class viewState extends State<view> {
  late List<model> list = <model>[];

  r() async {
    list = await api.API("users");
    // print("=======================================");
    // print(list[2].id);
    // print("=======================================");

    setState(() {});
  }

  @override
  void initState() {
    r();
    super.initState();
  }

  testt(var command) async {
    if (await canLaunch(command))
      await launch(command);
    else
      throw "cant run this-> $command";
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("APi"),
        centerTitle: true,
      ),
      body: list.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) => Card(
                    elevation: 5,
                    color: Colors.greenAccent,
                    child: InkWell(
                      onTap: () async {
                        var serviceEnabled = await Location.instance.serviceEnabled();
                        if (!serviceEnabled) {
                          serviceEnabled = await Location.instance.requestService();
                        }else
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => mapss()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${list[i].name}"),
                                CircleAvatar(
                                    child: Text("${list[i].id}"), radius: 12)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${list[i].email}"),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        testt('tel:${list[i].phone}');
                                      },
                                      icon: Icon(Icons.call)),
                                  radius: 23,
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        testt(
                                            'mailto:${list[i].email}?subject=test%20subject&body=test%20body');
                                      },
                                      icon: Icon(Icons.email)),
                                  radius: 23,
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        height: we / 6,
                      ),
                    ),
                  )),
    );
  }
}
