import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:dispositivos_moviles/User/screens/main_screen.dart';
import 'package:dispositivos_moviles/User/screens/profile_screen.dart';
import 'package:dispositivos_moviles/User/screens/user_exercises.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:dispositivos_moviles/User/screens/user_profile_background.dart';

class NavigationBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NavigationBar();
  }
}

class _NavigationBar extends State<NavigationBar> {

  AppUser appUser;

  int indexScreen = 0;

  final List<Widget> widgetsChildren = [
    BlocProvider<AppUser>(bloc: AppUser(), child:MainScreen()),
    BlocProvider<AppUser>(bloc: AppUser(), child:UserExercises()),
    BlocProvider<AppUser>(bloc: AppUser(), child: UserProfileWithBackground())
  ];
  void onScreen(int index) {

    setState(() {
      indexScreen = index;
      appUser = AppUser();
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
                  icon: Icon(Icons.playlist_add_check),
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