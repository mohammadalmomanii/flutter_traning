import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownSearch1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DropDownSearch1State();
  }
}

class DropDownSearch1State extends State<DropDownSearch1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DropDownSearch"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItems: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Menu mode",
                hint: "country in menu mode",
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: print,
                selectedItem: "Brazil")
          ],
        ),
      ),
    );
  }
}
