import 'package:firebase_auth/firebase_auth.dart';
import 'package:dispositivos_moviles/User/firebase_authentication.dart';

class AuthenticationRepository  {

  final _firebaseAuthentication = FirebaseAuthentication();

  Future<User> signInFirebase() => _firebaseAuthentication.signIn();
}