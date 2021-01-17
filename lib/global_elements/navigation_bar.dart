import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:dispositivos_moviles/User/screens/main_screen.dart';
import 'package:dispositivos_moviles/User/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class NavigationBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NavigationBar();
  }
}

class _NavigationBar extends State<NavigationBar> {

  int indexScreen = 0;

  final List<Widget> widgetsChildren = [
    MainScreen(),
    BlocProvider<AppUser>(bloc: AppUser(), child: UserProfile())
  ];
  void onScreen(int index) {

    setState(() {
      indexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:widgetsChildren[indexScreen],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.orangeAccent,
          primaryColor: Colors.deepOrange
        ),
        child: BottomNavigationBar(
          onTap: onScreen,
          currentIndex: indexScreen,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("")
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("")
              ),
            ]
        ),
      ),
    );
  }
}