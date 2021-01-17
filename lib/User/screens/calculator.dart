import 'dart:math';
import 'dart:ui' as ui;

import 'package:decimal/decimal.dart';
import 'package:dispositivos_moviles/global_elements/navigation_bar.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: _Calculator(),
    );
  }
}

class _Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IMC();
}

class IMC extends State<_Calculator> {
  final controller_weight = TextEditingController();
  final controller_height = TextEditingController();
  final my_form_key = GlobalKey<FormState>();
  final d = Decimal;

  String showIMC = "";
  String suggWeight = "";

  void WomanWeight() {
    int idealW = 21;
    int decimals = 2;
    int formula = pow(10, decimals);

    if (my_form_key.currentState.validate()) {
      double weight = double.parse(controller_weight.text);
      double height = double.parse(controller_height.text);
      double rtaHeight = (height) / 100;
      double heighttwo = rtaHeight * rtaHeight;
      double result = weight / heighttwo;
      double d = result;
      d = (d * formula).round() / formula;

      double sugerido = (idealW * weight) / d;
      sugerido = (sugerido * formula).round() / formula;

      setState(() {
        showIMC = "BMI is: $d";
      });

      setState(() {
        suggWeight = "Ideal weight is: $sugerido Kg";
      });
    }
  }

  void MenWeight() {
    int idealWm = 24;
    int decimals = 2;
    int formula = pow(10, decimals);

    if (my_form_key.currentState.validate()) {
      double weight = double.parse(controller_weight.text);
      double height = double.parse(controller_height.text);
      double rtaHeight = (height) / 100;
      double heighttwo = rtaHeight * rtaHeight;
      double result = weight / heighttwo;
      double d = result;
      d = (d * formula).round() / formula;

      double sugerido = (idealWm * weight) / d;
      sugerido = (sugerido * formula).round() / formula;

      setState(() {
        showIMC = "BMI is: $d";
      });

      setState(() {
        suggWeight = "The ideal weight is: $sugerido Kg";
      });
    }
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  void MathOp() {
    if (my_form_key.currentState.validate()) {
      double num1 = double.parse(controller_weight.text);
      double num2 = double.parse(controller_height.text);

      double result = num1 / num2;

      setState(() {
        showIMC = "The division is: $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('BMI calculator'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoBack();
          },
        ),
      ),
      body: Form(
          key: my_form_key,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: new Image(
                            width: 200.0,
                            height: 150.0,
                            image: new AssetImage('img/scale.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 115,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_weight,
                            validator: (value) {
                              if (value.isEmpty) return "Put your weight in Kg";
                            },
                            decoration: InputDecoration(
                                hintText: "Weight Kg",
                                icon: Icon(Icons.account_balance_wallet,
                                    color: Colors.purpleAccent)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(),
                        Container(
                          width: 115,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_height,
                            validator: (value) {
                              if (value.isEmpty) return "Put your height in Cm";
                            },
                            decoration: InputDecoration(
                                hintText: "Height Cm",
                                icon: Icon(Icons.present_to_all,
                                    color: Colors.orange)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: WomanWeight,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.pinkAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[Icon(Icons.person), Text('Women')],
                        ),
                      ),
                      VerticalDivider(),
                      FlatButton(
                        onPressed: MenWeight,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blueAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[Icon(Icons.person), Text('Men')],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFE2E64), Color(0xFFfF781D8)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        showIMC,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 15.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFf04B4AE), Color(0xFFf81F7F3)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        suggWeight,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: new Image(
                            width: 300.0,
                            height: 200.0,
                            image: new AssetImage('img/imc.jpg'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }

  void GoBack() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NavigationBar(),
      ),
    );
  }
}
