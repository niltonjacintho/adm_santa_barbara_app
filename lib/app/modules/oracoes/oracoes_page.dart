import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'oracoes_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OracoesPage extends StatefulWidget {
  final String title;
  const OracoesPage({Key key, this.title = "Oracoes"}) : super(key: key);

  @override
  _OracoesPageState createState() => _OracoesPageState();
}

class _OracoesPageState extends ModularState<OracoesPage, OracoesController> {
  //use 'controller' variable to access controller
  OracoesController oracoesController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) => RaisedButton(
              onPressed: () async {
                await oracoesController.carregarGrupos();
                //   await oracoesController.carregarOracoes('comum', 0);
                int cont = 0;
                oracoesController.oracoesModel.grupo.forEach((element) async {
                  await oracoesController.carregarOracoes(element.url, cont);
                  cont++;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
