import 'package:dispositivos_moviles/main.dart';
import 'package:flutter/material.dart';
import 'package:dispositivos_moviles/global_elements/background.dart';
import 'package:dispositivos_moviles/global_elements/button_login.dart';
import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:dispositivos_moviles/User/screens/main_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  AppUser appUser;
  Widget handleCurrentSession() {
    return StreamBuilder(
      stream: appUser.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return MyHomePage();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundLogIn("", null),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Exercise App",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                ButtonLogIn()
              ])
        ],
      ),
    );
  }

  void changescreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }
}
