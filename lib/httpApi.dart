import 'dart:convert';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tap_bar_flutter/Model.dart';

class httpApi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return httpApiState();
  }
}

class model {
  int userId;
  int id;
  String title;
  String body;

  model(this.userId, this.id, this.title, this.body);
}

class httpApiState extends State<httpApi> {
  List<Model> list = [];

  getAPI() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var respnse = await http.get(uri);

    var responseBody = jsonDecode(respnse.body);
    

    setState(() {
      for (var x in responseBody) {
        list.add(Model.a(1666,body: "sd",title: "we",id: 66));
        list.add(Model(title: x["title"],body: x["body"],id:x["id"],userId: x["userId"] ));
      }
    });
  }

  @override
  void initState() {
    print("************");
    print("******$list******");
    getAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("httpApi"),
        centerTitle: true,
      ),
      body: list == null || list.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: list.length,
          itemBuilder: (con, i) =>
              Card(
                margin: EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("id : ${list[i].id}"),
                        Text("userId : ${list[i].userId}")
                      ],
                    ),
                    Text(
                      "title : ${list[i].title}",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("body : ${list[i].body}"),
                  ],
                ),
              )),
    );
  }
}
