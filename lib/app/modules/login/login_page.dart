import 'dart:html';

import 'package:admFlutter/app/models/login.model.dart';
import 'package:admFlutter/app/shared/auth_service.dart';
import 'package:admFlutter/app/shared/cores.service.dart';
import 'package:admFlutter/app/shared/igreja.dart';
import 'package:admFlutter/app/shared/util_service.dart';
import 'package:chrome_dev_tools/domains/page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  LoginInterface _login = new LoginInterface();
  UtilService utilService = new UtilService();
  AuthService authService = new AuthService();
  // FlutterWebView flutterWebView = new FlutterWebView();

  @override
  Widget build(BuildContext context) {
    // InAppWebViewController webView;
    CargaIgreja gerador = new CargaIgreja();

    double progress = 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80, left: 30),
            child: Center(
              child: SizedBox(
                width: 300,
                height: 400,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Image.asset(
                            'images/paroquia.jpg',
                            height: 125,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).copyWith().size.width,
                        decoration: new BoxDecoration(color: Colors.red),
                        child: Text(
                          'Paróquia Santa Barbara',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 2,
                              fontSize: 16,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      new Form(
                        key: _formKey,
                        autovalidate: _autovalidate,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                //    controller: _login,
                                initialValue: 'nilton.jacintho@gmail.com',
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: "email",
                                  contentPadding: EdgeInsets.all(2),
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red[400])),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: utilService.validateEmail,
                                onSaved: (value) {
                                  _login.email = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                //      controller: _passw,
                                initialValue: '123456',
                                textCapitalization: TextCapitalization.words,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "senha",

                                  contentPadding: EdgeInsets.all(2),
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red[400])),

                                  //border: InputBorder.none
                                ),
                                keyboardType: TextInputType.text,
                                validator: utilService.validatePass,
                                onSaved: (value) {
                                  _login.senha = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RaisedButton(
                                    elevation: 8,
                                    color: Cores().corOk,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        print('kkk');
                                        authService.signIn(
                                            _login.email, _login.senha);
                                      } else {
                                        setState(() {
                                          _autovalidate = true;
                                        });
                                      }
                                    },
                                    child: new Text(
                                      'Entrar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  // RaisedButton(
                                  //   onPressed: () async {
                                  //     gerador.criar();
                                  //   },
                                  // ),
                                  // RaisedButton(
                                  //   child: new Text(
                                  //     'Gerador de paróquias',
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   onPressed: () async {
                                  //     gerador.enviar();
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
