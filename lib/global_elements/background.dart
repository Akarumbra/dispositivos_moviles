import 'package:flutter/material.dart';

class BackgroundLogIn extends StatelessWidget {

  String title = "Background login";
  double height = 0.0;

  BackgroundLogIn(this.title, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.greenAccent
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),

      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.bold
        ),
      ),

      alignment: Alignment(-0.9, -0.6),
    );
  }
}