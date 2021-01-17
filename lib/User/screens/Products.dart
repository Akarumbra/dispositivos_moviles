import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _Products createState() => _Products();
}

class _Products extends State<Products> {
  List<Container> listamos = List();

  var arreglox = [
    {
      "name": "Whey protein",
      "img": "whey.jpg",
      "description":
          "24 Grams of Protein per Serving to Help Build and Maintain Muscle"
    },
    {
      "name": "Creatine",
      "img": "creatine.jpg",
      "description":
          "Creatine monohydrate has been extensively studied and shown to help support muscle size, strength and recovery when used consistently over time in conjunction with a healthy, balanced diet and regular weight training.1"
    },
    {
      "name": "Glutamine",
      "img": "glutamine.jpg",
      "description":
          "Glutamine is the most abundant amino acid in the body, comprising more than 60% of the free amino acid pool in skeletal muscle and greater than 20% of total circulating amino acids. During prolonged, intense exercise, muscle glutamine levels may be depleted, and this can limit protein synthesis.1 Glutamine Powder is an easy way to supplement your diet. This instantized powder mixes easily and is unflavored for 'stacking' with protein shakes."
    },
    {
      "name": "Pre Workout",
      "img": "prew.jpg",
      "description":
          " It’s designed to help you unleash intense energy, pumps and performance so you can reach the pinnacle of your game and crush your next set."
    }
  ];

  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String img = arregloxyz["img"];

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arregloxyz['name'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                          name: arregloxyz['name'],
                          img: img,
                          description: arregloxyz['description']),
                    )),
                    child: new Image.asset("img/$img", fit: BoxFit.contain),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                arregloxyz['name'],
                style: new TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Useful products'),
        backgroundColor: Colors.orange,
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 50.0,
        childAspectRatio: 0.75,
        children: listamos,
      ),
    );
  }
}

class Detalle extends StatelessWidget {
  Detalle({this.name, this.img, this.description});
  final String name;
  final String img;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 400.0,
              child: new Hero(
                tag: name,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$img",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new IniciarNombre(
            name: name,
          ),
          new IniciarIcon(),
          new Informacion(
            description: description,
          ),
        ],
      ),
    );
  }
}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(children: <Widget>[
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                name,
                style: new TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            description,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
