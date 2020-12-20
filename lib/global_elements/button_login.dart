import 'package:flutter/material.dart';
import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ButtonLogIn extends StatefulWidget {

  final VoidCallback onPressed;
  ButtonLogIn(this.onPressed);

  @override
  State createState() {
    return _ButtonLogIn();
  }
}

class _ButtonLogIn extends State<ButtonLogIn> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 20.0
        ),
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white70
            ],
            begin: FractionalOffset(0.2, 0.0),
            end:  FractionalOffset(1.0, 0.6),
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Text("Sign in with Google",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black45,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}