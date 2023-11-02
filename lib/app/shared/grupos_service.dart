import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class GruposService extends Disposable {
  @override
  void dispose() {}
  Map<String, String> categorias = new Map<String, String>();
  GruposService() {
    // categorias.putIfAbsent(100, () => 'Avisos');
    // categorias.putIfAbsent(200, () => 'Notícias Católicas');
    // categorias.putIfAbsent(400, () => 'Padres');
    // categorias.putIfAbsent(700, () => 'Perguntas');
    // categorias.putIfAbsent(800, () => 'Horários');
    categorias = new Map<String, String>();
    print('will get groups');
    fb.firestore().collection("grupos").get().then(
          (value) => value.docs.forEach((doc) {
            print('DOC ${doc.data()["titulo"]}');
            categorias.putIfAbsent(
                doc.data()["id"], () => doc.data()["titulo"]);
          }),

          // print('VALUE DE GRUPOS $value'),
        );
  }

  List<dynamic> getListGrupos() {
    List<dynamic> x = [];
    int c = 1;
    categorias.forEach((k, v) => {
          x.add({"value": c, "display": v}),
          print('add to getlistgroup $k  e $v'),
          c++,
        });
    return x;
  }
}
