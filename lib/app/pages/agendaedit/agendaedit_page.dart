import 'package:flutter/material.dart';

class AgendaeditPage extends StatefulWidget {
  final String title;
  const AgendaeditPage({Key key, this.title = "Agendaedit"}) : super(key: key);

  @override
  _AgendaeditPageState createState() => _AgendaeditPageState();
}

class _AgendaeditPageState extends State<AgendaeditPage> {
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
