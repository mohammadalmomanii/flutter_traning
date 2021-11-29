import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class AwesomeDialog1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AwesomeDialog1State();
  }
}

class AwesomeDialog1State extends State<AwesomeDialog1> {
  TextEditingController et_test = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AwesomeDialog"),
        centerTitle: true,
      ),
      body: Center(child: ElevatedButton(onPressed: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.QUESTION,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Dialog Title',
          body: TextFormField(controller: et_test,),
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(et_test.text),
              behavior: SnackBarBehavior.floating,));
          },
        )
          ..show();
      }, child: Text("showDialog"),),
      )
      ,
    );
  }
}
