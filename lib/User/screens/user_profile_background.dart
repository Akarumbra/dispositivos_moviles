import 'package:dispositivos_moviles/global_elements/background.dart';
import 'package:flutter/material.dart';
import 'package:dispositivos_moviles/User/screens/profile_screen.dart';

class UserProfileWithBackground extends StatelessWidget {

  @override
  Widget build (BuildContext context) {

    return Stack(
      children: <Widget>[
        BackgroundLogIn("", null),
        ListView(
          children: <Widget>[
            UserProfile()
          ]
        )
      ],
    );
  }
}