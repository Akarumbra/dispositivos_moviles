import 'package:dispositivos_moviles/User/screens/user_exercises.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:dispositivos_moviles/User/screens/signin_screen.dart';
import 'package:dispositivos_moviles/User/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dispositivos_moviles/global_elements/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          title: 'Dispositivos móviles',
          home: SignInScreen(),
        ),
        bloc: AppUser());
  }
}
