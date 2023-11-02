import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'agenda_controller.dart';

class AgendaPage extends StatefulWidget {
  final String title;
  const AgendaPage({Key key, this.title = "Agenda"}) : super(key: key);

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends ModularState<AgendaPage, AgendaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
