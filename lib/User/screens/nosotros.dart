import 'package:flutter/material.dart';

class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Who we are"),
      ),
      body: new Center(
        child: new Text('This app is developed by Raul Morente & Daniel Ruiz'),
      ),
    );
  }
}
