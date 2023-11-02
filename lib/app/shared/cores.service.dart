import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Cores extends Disposable {
  @override
  void dispose() {}
  Color corErro = Color.fromRGBO(51, 0, 0, 1);
  Color corOk = Color.fromRGBO(0, 51, 0, 1);
  Color corFundo = Color.fromRGBO(51, 0, 0, 1);
  Color corLinha = Color.fromRGBO(255, 179, 179, 0.3);
  Color darkBlue = Color.fromRGBO(0, 0, 128, 1);
  String toastErrorColor = '#cc3300';
  TextStyle stilo = new TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
}
