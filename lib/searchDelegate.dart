import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchDelegate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return searchDelegateState();
  }
}

class searchDelegateState extends State<searchDelegate> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: dataSearch());
              },
              icon: Icon(Icons.search))
        ],
        centerTitle: true,
        title: Text("Search Delegate"),
      ),
    );
  }
}

class dataSearch extends SearchDelegate {
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
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
        //close(context, result)
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
    //showModalBottomSheet(context: context, builder: (context){return=>Container()})
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    List result = list.where((element) => element.contains(query)).toList();
    return Center(
      child: ListView.builder(
          itemCount: query == "" ? list.length : result.length,
          itemBuilder: (context, i) => InkWell(
                onTap: () {
                  query = query == "" ? list[i] : result[i];
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            alignment: Alignment.center,
                            child: Text(query),
                          ));
                },
                child: Container(
                  color: Colors.greenAccent,
                  margin: EdgeInsets.all(7),
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: Text("${query == "" ? list[i] : result[i]}"),
                ),
              )),
    );
  }
}
