import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login_anonymous extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return login_anonymous_state();
  }
}

class login_anonymous_state extends State<login_anonymous> {
  late UserCredential userCredential;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("login_anonymous"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: ElevatedButton(
              child: Text("login"),
              onPressed: () async {
                userCredential =
                    await FirebaseAuth.instance.signInAnonymously();

                print('ussser$userCredential');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text(
                "login",
                style: GoogleFonts.aclonica(),
              ),
              onPressed: () async {
                userCredential =
                    await FirebaseAuth.instance.signInAnonymously();

                print('ussser$userCredential');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("login"),
              onPressed: () async {
                userCredential =
                    await FirebaseAuth.instance.signInAnonymously();

                print('ussser$userCredential');
              },
            ),
          ),
        ]),
      ),
    );
  }
}
