import 'dart:io';
import 'dart:typed_data';

import 'package:admFlutter/app/models/agenda_atividade_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as firestore;

part 'agenda_controller.g.dart';

class AgendaController = _AgendaControllerBase with _$AgendaController;

abstract class _AgendaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  var uuid = Uuid();

  List<String> lines;
  List<AgendaAtividade> listAtividades = [];
  AgendaAtividade agendaAtividade = new AgendaAtividade();

  Future<File> writeToFile(ByteData data, String path) {
    ByteBuffer buffer = data.buffer;
    return File(path).writeAsBytes(buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    ));
  }

  Future<List<String>> getFileData(String path) async {
    print('entro na getfiledata');
    ByteData data = await rootBundle.load(path);

    print('vai pegar o tempdir $data');
    String directory = DateTime.now().millisecondsSinceEpoch.toString();
    //  (await getTemporaryDirectory()).path;
    print('tempdir = $directory');
    List<String> linhas = [];
    //new List<String>();
    await http.get('assets/data/agenda2020.csv').then((value) {
      linhas = value.body.split('\n');
    });
    print(linhas);
    return linhas;
  }

  Future<bool> _upload(String grupo, AgendaAtividade obj) async {
    var result = false;
    if (agendaAtividade.id == null || agendaAtividade.id == '') {
      agendaAtividade.id = uuid.v4();
    }
    firestore.DocumentReference reference =
        fb.firestore().doc("agenda/" + uuid.v4());
    print(reference);
    reference
        .set(agendaAtividade.toMap())
        .then((result) => {})
        .catchError((err) => print('ERROR $err'));
    return result;
  }

  uploadEventos() async {
    print('chegou no controller ...');
    var futureContent = await getFileData('/data/agenda2020.csv');
    print('pegou o arquivo $futureContent');
    futureContent.forEach((c) {
      try {
        if (c != '') {
          lines = c.split(",");
          print(
              'valor de c = $c e lines de 0 ${lines[0]}  ${lines[1]}  ${lines[2]}  ${lines[3]}  ${lines[4]}  }');
          if ((lines[0] != 'data') && (lines[0] != '')) {
            try {
              lines[4] = lines[4];
            } catch (e) {
              lines.add('');
            }
            agendaAtividade = new AgendaAtividade();
            agendaAtividade.id = '';
            agendaAtividade.data = lines[0];
            agendaAtividade.atividade = lines[1];
            agendaAtividade.pastoral = lines[2];
            agendaAtividade.hora = lines[3];
            agendaAtividade.local = lines[4];
            agendaAtividade.detalhes = '';
            listAtividades.add(agendaAtividade);
            print(' antes do upload1 ${lines[1]}');
            _upload('agenda', agendaAtividade);
          }
        }
      } catch (e) {
        print(e);
        print('c em error $c');
      }

      //})
    });
  }
}
