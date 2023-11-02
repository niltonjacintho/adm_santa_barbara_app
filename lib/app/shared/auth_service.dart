import 'package:admFlutter/app/modules/home/home_page.dart';
import 'package:admFlutter/app/modules/login/login_page.dart';
import 'package:admFlutter/app/shared/util_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthService {
  // singleton
  static final AuthService _singleton = AuthService._internal();
  factory AuthService() => _singleton;
  AuthService._internal();
  static AuthService get shared => _singleton;
  //Handle Authentication
  // UsuarioController usuarioController = Modular.get();

  User activeUser;

  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    print('vai logar $email $password');
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      activeUser = user.user;
      print('voltou');
      print(user.user.displayName);
      print(user.user.email);
      print(user.user.photoURL);
      Modular.to.pushReplacementNamed('/home');
    }).catchError((e) {
      print('Erro de logar $e');
      UtilService().toast('Usuário ou senha inválidos');
    });
  }
}
