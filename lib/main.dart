import 'package:flutter/material.dart';
import 'package:admFlutter/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase_core/firebase_core.dart';

void main() {
  //const firebaseConfig = {   apiKey : "AIzaSyDikppRvC3xGB2Jikx_u_STV5kCGUYP51M" ,   authDomain : "paroquia.firebaseapp.com" ,   DatabaseURL : "https://paroquia.firebaseio.com" ,   projectId : "project-2297216869628270192" ,   storageBucket : "project-2297216869628270192.appspot .com " ,   messagingSenderId : " 999243580674 " ,   appId : " 1: 999243580674: web: 97bcb06337ef4d04352e1b " };
  if (fb.apps.isEmpty) {
    print('inicializando');
    fb.initializeApp(
        apiKey: "AIzaSyDrLJSTixX72vvVGhXUax0XCvZS4Jzsj_I",
        authDomain: "paroquia.firebaseapp.com",
        // googleAppID: '999243580674',

        databaseURL: "https://paroquia.firebaseio.com",
        projectId: "project-2297216869628270192",
        storageBucket: "project-2297216869628270192.appspot.com",
        messagingSenderId: "999243580674");
    //print(fb.apps);
  }
  return runApp(App());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ModularApp(module: AppModule()),
//     );
//   }
// }

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return null;
          //  SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ModularApp(module: AppModule()),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return new Text('Loading()');
      },
    );
  }
}
