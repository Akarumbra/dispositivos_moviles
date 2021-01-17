import 'package:dispositivos_moviles/main.dart';
import 'package:flutter/material.dart';
import 'package:dispositivos_moviles/User/screens/calculator.dart';
import 'package:dispositivos_moviles/User/screens/nosotros.dart';
import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:dispositivos_moviles/User/screens/signin_screen.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  AppUser appUser;

  List<Container> list = List();
  var arr = [
    {"name": "Deadlift", "img": "gym.jpeg", "sport": "img/infodeadlift.jpg"},
    {"name": "Chest", "img": "pressbanca.jpg", "sport": "img/benchinfo.png"},
    {"name": "Back", "img": "remo.jpeg", "sport": "Row with bar, 10 reps"},
    {
      "name": "Biceps",
      "img": "curl.jpg",
      "sport": "Workout with bar 10 reps of 80kg"
    },
  ];

  _list() async {
    for (var i = 0; i < arr.length; i++) {
      final arrxyz = arr[i];
      final String img = arrxyz["img"];

      list.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
            child: new Column(
          children: <Widget>[
            new Hero(
              tag: arrxyz['name'],
              child: new Material(
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detalle(
                        name: arrxyz['name'], img: img, sport: arrxyz['sport']),
                  )),
                  child: new Image.asset("img/$img", fit: BoxFit.contain),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new Text(
              arrxyz['name'],
              style: new TextStyle(fontSize: 20.0),
            )
          ],
        )),
      ));
    }
  }

  @override
  void initState() {
    _list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appUser = BlocProvider.of(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Fitness'),
        backgroundColor: Colors.orange,
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Exercises'),
            accountEmail: new Text('username@gmail'),
            decoration: new BoxDecoration(
                image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('img/pressbanca.jpg'),
            )),
          ),
          new Divider(),
          new ListTile(
            title: new Text("BMI Calculator"),
            trailing: new Icon(Icons.fitness_center),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Calculator(),
            )),
          ),
          new Divider(),
          new ListTile(
            title: new Text("Support"),
            trailing: new Icon(Icons.fitness_center),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Nosotros(),
            )),
          ),
        ]),
      ),
      body: new GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 1.0,
        childAspectRatio: 0.899,
        children: list,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: appUser.signOut,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}

class Detalle extends StatelessWidget {
  Detalle({this.name, this.img, this.sport});
  final String name;
  final String img;
  final String sport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(children: <Widget>[
        new Container(
          height: 240.0,
          child: new Hero(
              tag: name,
              child: new Material(
                  child: new InkWell(
                child: new Image.asset(
                  "img/$img",
                  fit: BoxFit.cover,
                ),
              ))),
        ),
        new IniciarNombre(
          name: name,
        ),
        new IniciarIcon(),
        new Info(
          sport: sport,
        ),
      ]),
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
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  name,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  '$name',
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            )),
          ],
        ));
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
    ));
  }
}

class Info extends StatelessWidget {
  Info({this.sport});
  final String sport;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Image.asset(
            sport,
          ),
        ),
      ),
    );
  }
}
