import 'package:admFlutter/app/models/oracao_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:uuid/uuid.dart';

import 'package:mobx/mobx.dart';

part 'oracoes_controller.g.dart';

class OracoesController = _OracoesControllerBase with _$OracoesController;

abstract class _OracoesControllerBase with Store {
  @observable
  int value = 0;
  Uuid uuid = Uuid();

  String urlBase = 'http://localhost/oracao';
  String urlGrupos = 'http://localhost/oracao/oracoes.html#comum';
  String urlBaseOracoes = 'http://localhost/oracao/oracoes.html#todas';
  String htmlBase = '';

  @action
  void increment() {
    value++;
  }

  @observable
  OracoesModel oracoesModel = new OracoesModel();

  Future<String> _gethtmlBase({String url = ''}) async {
    if (url == '') {
      url = urlGrupos;
    }
    try {
      await Dio().get(url).then((value) => htmlBase = value.data);
      return htmlBase;
    } catch (e) {
      return 'Erro Http $e';
    }
  }

  processarCarga() async {
    await carregarGrupos();
    // int cont = 0;
    for (var i = 0; i < oracoesModel.grupo.length; i++) {
      Grupo element = oracoesModel.grupo[i];
      await carregarOracoes(element.url, i).then(
          (List<Oracoes> value) => {oracoesModel.grupo[i].oracoes = value});
    }
    //  print('DADOS DE GRUPOS');
    List lista = [];

    for (Grupo item in oracoesModel.grupo) {
      print('${item.nome} ${item.url}');
      for (Oracoes x in item.oracoes) {
        fs.DocumentReference reference =
            fb.firestore().doc("oracoes/" + x.titulo.replaceAll('/', '-'));
        lista
            .add({"titulo": x.titulo.replaceAll('/', '-'), "grupo": item.nome});
        reference
            .set(x.toJson())
            .then((result) => {})
            .catchError((err) => print('ERROR $err'));
      }
    }
    fs.DocumentReference reference = fb.firestore().doc("oracoes/lista/");
    reference
        .set({"oracoes": lista})
        .then((result) => {})
        .catchError((err) => print('ERROR $err'));
  }

  carregarGrupos() async {
    try {
      await _gethtmlBase().then((value) => value = '');
      var html = htmlBase.substring(htmlBase.indexOf('<a href="#co'));
      html = html.substring(0, html.indexOf('</div'));
      oracoesModel = new OracoesModel();
      oracoesModel.grupo = [];
      //new List<Grupo>();
      Grupo g;
      while (html.indexOf('<a href=') > -1) {
        g = new Grupo();
        g.url =
            html.substring(html.indexOf('href="') + 7, html.indexOf('" data'));
        g.nome =
            html.substring(html.indexOf('"none">') + 7, html.indexOf('</a>'));
        oracoesModel.grupo.add(g);
        try {
          html = html.substring(html.indexOf('<a href=', 1));
        } catch (e) {
          html = '';
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Oracoes>> carregarOracoes(String grupo, int id) async {
    String html2 = htmlBase; // response.data;
    html2 = html2.substring(html2.indexOf('<div id="$grupo" '));
    html2 = html2.substring(html2.indexOf('<li>') + 4);
    html2 = html2.substring(0, html2.indexOf('<div data-role="panel"', 1));
    oracoesModel.grupo[id].oracoes = [];
    //new List<Oracoes>();
    Oracoes oracoes = new Oracoes();
    List<Oracoes> listOracoes = [];
    //new List<Oracoes>();
    while (html2.indexOf('<li><a href="') > -1) {
      oracoes = new Oracoes();
      oracoes.grupo = grupo;
      oracoes.titulo = html2.substring(
          html2.indexOf('none">') + 6, html2.indexOf('</a></li>'));
      oracoes.id =
          html2.substring(html2.indexOf('phpid=') + 6, html2.indexOf('.html'));
      await getCorpoOracao(oracoes.id).then((String value) => {
            // print(' ${oracoes.id}  $value titulo ${oracoes.titulo}'),
            oracoes.texto = value
          });
      listOracoes.add(oracoes);
      // if (grupo == 'comum') print('GRUPO COMUM $html2');
      try {
        html2 = html2.substring(html2.indexOf('<li><a href="', 1));
        //  if (grupo == 'comum') print('GRUPO COMUM APOS O CORTE  $html2');
      } catch (e) {
        html2 = '';
      }
    }
    return listOracoes;
  }

  Future<String> getCorpoOracao(String id) async {
    String htmlOracao = '';
    String url = urlBase + '/oracao.phpid=${id}.html';

    await Dio().get(url).then((value) => htmlOracao = value.data);

    htmlOracao =
        htmlOracao.substring(htmlOracao.indexOf('<p align=justify>') + 17);
    htmlOracao = htmlOracao.substring(0, htmlOracao.indexOf('</p>'));
    htmlOracao = htmlOracao.replaceAll('<br>', '\\n');
    // if (id == "1") print('ORACAO LIDA DO SITE apos corte $htmlOracao');
    return htmlOracao;
  }

  gravar(OracoesModel o) {
    // print('VAI GRAVAR ${paroquia.toJson()}');
    // fs.DocumentReference reference = fb.firestore().doc("oracoes/" + uuid.v4());
    // print(reference);
    print('VAI LISTA O OBJETO DAS ORAÇÕES');
    print(o.toJson());
    // reference
    //     .set(o.toJson())
    //     .then((result) => {})
    //     .catchError((err) => print('ERROR $err'));
  }
}
