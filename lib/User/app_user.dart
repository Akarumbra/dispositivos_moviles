import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dispositivos_moviles/User/authentication_repository.dart';

class AppUser implements Bloc {

  final _authenticationRepository = AuthenticationRepository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  Future<User> signIn() {
    return _authenticationRepository.signInFirebase();
  }

  signOut() {
    _authenticationRepository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}