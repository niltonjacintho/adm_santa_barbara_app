import 'package:admFlutter/app/models/documentsModel.dart';
import 'package:admFlutter/app/shared/cores.service.dart';
import 'package:admFlutter/app/shared/grupos_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase/firestore.dart' as fs;
import 'documentos_controller.dart';

class DocumentosPage extends StatefulWidget {
  final String title;
  const DocumentosPage({Key key, this.title = "Gestão de artigos e documentos"})
      : super(key: key);

  @override
  _DocumentosPageState createState() => _DocumentosPageState();
}

class _DocumentosPageState
    extends ModularState<DocumentosPage, DocumentosController> {
  //use 'controller' variable to access controller
  DocumentosController documentosController = Modular.get();
  GruposService gruposService = Modular.get();// new GruposService();
  String getTexto(fs.DocumentSnapshot doc, String campo) {
    return doc.data()[campo] != null
        ? doc.data()[campo].toString().trim()
        : ' ';
  }

  @override
  Widget build(BuildContext context) {
    Stream<fs.QuerySnapshot> myStream = documentosController.getStreamAvisos();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          documentosController.documentoAtivo = new DocumentsModel();
          documentosController.documentoAtivo.ativo = true;
          Modular.to.pushNamed('/documentosEdit');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Center(
        // alignment: Alignment.topCenter,
        child: SizedBox(
          width: 600,
          height: 700,
          child: Card(
            color: Cores().corFundo,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text('Paróquia Santa Barbara'),
                  backgroundColor: Colors.green,
                  expandedHeight: 200,
                  floating: true,
                  pinned: true,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/paroquiadrone.jpeg',
                      fit: BoxFit.cover,
                    ),
                    //  Text('2222'),
                  ),
                ),
                StreamBuilder<fs.QuerySnapshot>(
                  stream: myStream,
                  builder: (context, snapshot) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return GestureDetector(
                            onDoubleTap: () {
                              documentosController.setDocumentoAtivo(
                                  snapshot.data.docs[index].data());
                              Modular.to.pushNamed('/documentosEdit');
                            },
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: Cores().corFundo,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0)),
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: Row(children: [
                                  Image.network(
                                    snapshot.data.docs[index]
                                                .data()['imagem'] !=
                                            null
                                        ? snapshot.data.docs[index]
                                            .data()['imagem']
                                        : 'https://via.placeholder.com/150/',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            getTexto(snapshot.data.docs[index],
                                                'titulo'),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            getTexto(snapshot.data.docs[index],
                                                'subtitulo'),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //     ),
                                  Text(
                                    gruposService.categorias[snapshot
                                                .data.docs[index]
                                                .data()['grupo']] ==
                                            null
                                        ? " "
                                        : gruposService.categorias[snapshot
                                            .data.docs[index]
                                            .data()['grupo']],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ]),
                              ),
                              //    ),
                            ),
                          );
                        },
                        childCount:
                            snapshot.hasData ? snapshot.data.docs.length : 0,
                      ),
                      //          ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
