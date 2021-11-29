import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalStorage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InternalStorageState();
  }
}

class InternalStorageState extends State<InternalStorage> {
  late SharedPreferences sharedPreferences;

  InternalStorag() async {
    sharedPreferences = await SharedPreferences.getInstance();


  }

  @override
  void initState()  {
    InternalStorag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("InternalStorage"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            sharedPreferences.setString("name", "Mohammad Almomani");
            sharedPreferences.setString("date", DateTime.now().hour.toString());
          }, child: Text("Savedata")),
          ElevatedButton(
              onPressed: () {
                print(sharedPreferences.getString("name"));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "name is : ${sharedPreferences.getString("name")}\n ${sharedPreferences.getString("date")}")));
              },
              child: Text("Showdata"))
        ],
      ),
    );
  }
}
