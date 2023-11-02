import 'package:admFlutter/app/shared/util_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pastorais_controller.dart';

class PastoraisPage extends StatefulWidget {
  final String title;
  const PastoraisPage({Key key, this.title = "Pastorais"}) : super(key: key);

  @override
  _PastoraisPageState createState() => _PastoraisPageState();
}

class _PastoraisPageState
    extends ModularState<PastoraisPage, PastoraisController> {
  PastoraisController pastoraisController = Modular.get();

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    pastoraisController.getPastorais();
    return Padding(
      padding:
          EdgeInsets.only(top: 10, left: largura * 0.18, right: largura * 0.18),
      child: Scaffold(
        appBar: AppBar(
          title: UtilService().header('Nossas Pastorais'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            pastoraisController.add();
            Modular.to.pushNamed('/pastoraledit');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                onChanged: (value) {
                  pastoraisController.filtro = value;
                  pastoraisController.lista(value);
                },
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Digite algo para pesquisar'),
              ),
              //),
            ),
            Expanded(
              child: Observer(
                builder: (context) => ListView.builder(
                  itemCount: pastoraisController.listaPastorais.length,
                  itemBuilder: (BuildContext context, int index) {
                    return pastoraisController.listaPastorais.isNotEmpty
                        ? Column(
                            children: <Widget>[
                              GestureDetector(
                                onDoubleTap: () {
                                  pastoraisController.pastoralAtiva =
                                      pastoraisController.listaPastorais[index];
                                  Modular.to.pushNamed('/pastoraledit');
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(pastoraisController
                                                .listaPastorais[index]
                                                .titulo) !=
                                            null
                                        ? Text(pastoraisController
                                            .listaPastorais[index].titulo)
                                        : ' ',
                                    trailing: Text(pastoraisController
                                                .listaPastorais[index].sigla !=
                                            null
                                        ? pastoraisController
                                            .listaPastorais[index].sigla
                                        : ' '),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
