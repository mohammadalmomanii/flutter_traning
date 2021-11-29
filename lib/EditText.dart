import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {

  late TextEditingController editControler;

  @override
  void initState() {
    editControler=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editControler,
                  onEditingComplete: () {
                    print("complete");
                  },
                  onFieldSubmitted: (text) {
                    print("${editControler.text} its work");
                  },
                  maxLength: 12,
                  onChanged: (text) {
                    print(text);
                  },
                  textInputAction: TextInputAction.go,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: false,
                      fillColor: Colors.cyan,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.lightGreen,
                      ),
                      labelText: "enter yor name",
                      labelStyle: TextStyle(color: Colors.lightGreen),
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: false,
                    fillColor: Colors.cyan,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.lightGreen,
                    ),
                    labelText: "enter yor name",
                    labelStyle: TextStyle(color: Colors.lightGreen),
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 15,
                        )))),
          ),
        ],
      ),
    );
  }
}
